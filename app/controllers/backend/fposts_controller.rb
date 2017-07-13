class Backend::FpostsController < ApplicationController
  require 'uri'

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
    @title = 'Nowy post'
  end

  def edit
    @title = 'Edycja postu'
  end

  def create
    # File.open(Rails.root.join('config/settings.yml'), 'w') { |f| f.write config.to_yaml }
    # post = @page_graph.put_wall_post(backend_fpost_params[:body])
    image_url = "http://188.166.152.13/uploads/image/image/1/mock1.jpg"
    image = URI.encode(image_url)
    pic = URI.parse(image)
    byebug
    post = @page_graph.put_connections(@page_id, message: backend_fpost_params[:body], picture: pic, link: pic)
    @backend_fpost = Fpost.new(backend_fpost_params)
    @backend_fpost.facebook_id = post['id']

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

  private
  def set_backend_fpost
    @backend_fpost = Fpost.find(params[:id])
  end

  def backend_fpost_params
    params.require(:fpost).permit(:body, :facebook_id)
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

  def post_to_timeline(msg, pic, ln)
    image_url = full_image_url(pic)
    link = ln
    if ln.nil?
      link = image_url
    end
    byebug
    @page_graph.put_connections(@page_id, 'feed', message: msg, picture: image_url, link: link)
  end

  def post_picture(pic)
    image_url = full_image_url(pic)
    @page_graph.put_picture(image_url)
  end

  def full_image_url(image)
    root_url + image.image_url
  end
end
