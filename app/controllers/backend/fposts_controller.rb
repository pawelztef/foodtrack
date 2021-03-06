class Backend::FpostsController < ApplicationController
  require 'addressable/uri'
  include FacebookConnections
  before_action :authenticate_admin!
  before_action :set_backend_fpost, only: [:show, :edit, :update, :destroy]
  before_action :retrive_facebook_page, only: [:create, :update, :destroy]
  layout 'backend_layout'

  def index
    @backend_fposts = Fpost.order(created_at: 'DESC').page(params[:page])
    @title = 'Wall Facebooka'
  end

  def show
  end

  def new
    @backend_fpost = Fpost.new
    @title = 'Nowy post Facebooka'
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
    respond_to do |format|
      if @backend_fpost.save
        posted = post_to_timeline(@backend_fpost)
        @backend_fpost.update_attributes(facebook_id: posted['id'])
        format.html { redirect_to backend_fposts_url, notice: 'Post został umieszczony na osi czasu.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @title = 'Edycja postu'
    msg = 'Post został umieszczony na osi czasu.'
    @backend_fpost.assign_attributes(backend_fpost_params)
    @backend_fpost.link_url = params[:post_link]
    begin
      @page_graph.delete_object(@backend_fpost.facebook_id)
    rescue
      msg = 'Post nie istniał na osi czasu facebooka aczkolwiek został ponownie na niej umieszczony.'
    ensure
      post = post_to_timeline(@backend_fpost)
      @backend_fpost.facebook_id = post["id"]
      respond_to do |format|
        if @backend_fpost.save
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
    byebug
    respond_to do |format|
      format.html
      format.js 
    end
  end

  private
  def set_backend_fpost
    @backend_fpost = Fpost.find(params[:id])
  end

  def backend_fpost_params
    params.require(:fpost).permit(:image, :body, :facebook_id, :link_url, :title)
  end

  def fetch_image
    if !params[:post_image_id].empty? 
      Image.find(params[:post_image_id]) 
    end
  end

end
