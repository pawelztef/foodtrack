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
    @title = 'Nowy post'
    @images = Image.all
    respond_to do |format|
      format.js
      format.html
    end
  end

  def edit
    @title = 'Edycja postu'
  end

  def create
    image = nil
    # image_url = image.image_url unless image.nil?
    image_url = "http://r.ddmcdn.com/s_f/o_1/APL/uploads/2014/10/5-human-foods-cats-can-eat0.jpg"
    link_url = backend_fpost_params[:link_url].present? ? backend_fpost_params[:link_url] : image_url 
    @backend_fpost = Fpost.new(backend_fpost_params)

    if !params[:post_image_id].empty?
      gallery_image = Image.find(params[:post_image_id])
      @backend_fpost.image = gallery_image 
    end

    # post = @page_graph.put_connections(@page_id, 'feed', message: backend_fpost_params[:body], picture: image_url, picture: image_url, link: link_url)
     # post = @page_graph.put_wall_post( "Testing post", {
     #  name: 'Iam a wall post',
     #  caption: 'Caption',
     #  picture: "https://d4n5pyzr6ibrc.cloudfront.net/media/27FB7F0C-9885-42A6-9E0C19C35242B5AC/D968A2D0-35B8-41C6-A94A0C5C5FCA0725/thul-3208cb1e-3118-5df2-8ab9-58e73f6da2b0.jpg?response-content-disposition=inline",
     #  link: image_url,
     #  link: "https://d4n5pyzr6ibrc.cloudfront.net/media/27FB7F0C-9885-42A6-9E0C19C35242B5AC/D968A2D0-35B8-41C6-A94A0C5C5FCA0725/thul-3208cb1e-3118-5df2-8ab9-58e73f6da2b0.jpg?response-content-disposition=inline",
     # })
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

  def add_image
    respond_to do |format|
      format.html
      format.js { @images = Image.all }
    end
  end

  def delete_image
  end

  private
  def set_backend_fpost
    @backend_fpost = Fpost.find(params[:id])
  end

  def backend_fpost_params
    params.require(:fpost).permit(:body, :facebook_id, :link_url)
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
