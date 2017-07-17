class Backend::FpostsController < ApplicationController
  require 'addressable/uri'
  include FacebookConnections
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

end
