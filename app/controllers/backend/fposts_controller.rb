class Backend::FpostsController < ApplicationController
  require 'addressable/uri'

  before_action :authenticate_admin!
  before_action :set_backend_fpost, only: [:show, :edit, :update, :destroy]
  before_action :retrive_facebook_page, only: [:create, :update, :destroy]
  layout 'backend_layout'

  def index
    @backend_fposts = Fpost.order(created_at: 'DESC').page(params[:page])
    @title = 'Linia czasu Facebooka'
  end

  def show
  end

  def new
    @backend_fpost = Fpost.new
    @images = Image.all
    @title = 'Nowy post'
    respond_to do |format|
      format.js
      format.html
    end
  end

  def edit
    @title = 'Edycja postu'
  end

  def create
    @backend_fpost = Fpost.new(backend_fpost_params)
    @backend_fpost.image = fetch_image 
    posted = post_to_timeline(@backend_fpost)
    @backend_fpost.facebook_id = posted['id']
    respond_to do |format|
      if @backend_fpost.save
        format.html { redirect_to backend_fposts_url, notice: 'Post został umieszczony na osi czasu.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @title = 'Edycja postu'
    msg = 'Post został umieszczony na osi czasu.'
    begin
      @page_graph.delete_object(@backend_fpost.facebook_id)
    rescue
      msg = 'Post nie istniał na osi czasu facebooka aczkolwiek został ponownie na niej umieszczony.'
      post = @page_graph.put_wall_post(backend_fpost_params[:body])
      @backend_fpost.facebook_id = post["id"]
    ensure
      respond_to do |format|
        if @backend_fpost.update(backend_fpost_params)
          format.html { redirect_to backend_fposts_url, notice: msg }
        else
          format.html { render :edit }
        end
      end
    end
  end

  def destroy
    msg = 'Post został unięty z osi czasu.'
    begin
      @page_graph.delete_object(@backend_fpost.facebook_id)
    rescue
      msg = 'Post nie istniał na osi czasu Facebooka aczkolwiek został usnięty z osi czasu aplikacji.'
    ensure
      @backend_fpost.destroy
      respond_to do |format|
        format.html { redirect_to backend_fposts_url, notice: msg }
      end
    end
  end

  def add_image
    respond_to do |format|
      format.html
      format.js { @images = Image.all }
    end
  end

  def delete_image
  end

  private

  def fetch_image
    if !params[:post_image_id].empty? 
      Image.find(params[:post_image_id]) 
    end
  end

  def set_backend_fpost
    @backend_fpost = Fpost.find(params[:id])
  end

  def backend_fpost_params
    params.require(:fpost).permit(:body, :facebook_id, :link_url, :title)
  end

  def retrive_facebook_page
    if auth = Koala::Facebook::API.new(session[:auth_token])
      page = auth.get_connections('me', 'accounts').first
      @page_token = page['access_token']
      @page_id = page['id']
      @page_graph = Koala::Facebook::API.new(@page_token)
    else
      redirect_to backend_dashboards_url, notice: 'Token sesji Facebooka wygasł.'
    end
  end

  def post_to_timeline(post)
    post_body = create_fpost_body(post)
    if post.image.present?
      image_url = fpost_image_url(post)
      @page_graph.put_connections(@page_id, 'feed', message: post_body, picture: image_url, link: image_url)
    elsif post.link_url.present?
      post_link = create_fpost_link(post)
      @page_graph.put_connections(@page_id, 'feed', message: post_body, picture: nil, link: post_link)
    else
      @page_graph.put_connections(@page_id, 'feed', message: post_body, picture: nil, link: nil)
    end
  end

  def create_fpost_body(post)
    "#{post.title}\r\n #{post.body}"
  end
  def create_fpost_link(post)
    post.link_url 
  end

  def fpost_image_url(post)
    if Rails.enf == "development"
      "http://r.ddmcdn.com/s_f/o_1/APL/uploads/2014/10/5-human-foods-cats-can-eat0.jpg" 
    else
      root_url + image.image_url unless post.image.nil?
    end
  end
end
