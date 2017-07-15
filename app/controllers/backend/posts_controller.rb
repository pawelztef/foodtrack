class Backend::PostsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_backend_post, only: [:show, :edit, :update, :destroy]
  layout 'backend_layout'

  def index
    @backend_posts = Post.all.order(publish_date: :desc)
    @title = "Lista Postów"
  end

  def show
    @title = "Edycja postu"
  end

  def new
    @backend_post = Post.new
    @title = 'Nowy post'
  end

  def edit
    @title = 'Edycja postu'
    respond_to do |format|
      format.html
      format.js { @images = Image.all }
    end
  end

  def create
    @title = 'Edycja postu'
    @backend_post = Post.new(backend_post_params)
    @backend_post.image = fetch_image
    respond_to do |format|
      if @backend_post.save
        format.html { redirect_to backend_posts_url, notice: 'Post został zapisany.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @title = 'Edycja postu'
    @backend_post.image = fetch_image
    respond_to do |format|
      if @backend_post.update(backend_post_params)
        format.html { redirect_to backend_posts_url, notice: 'Post został zapisany.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @backend_post.destroy
    respond_to do |format|
      format.html { redirect_to backend_posts_url, notice: 'Post został zapiany.' }
      format.json { head :no_content }
    end
  end

  def delete_image
    @post = Post.find_by_slug(params[:id])
    @post.image = nil
    if @post.save
      redirect_to edit_backend_post_path(params[:id]), notice: 'Zdjęcie zostało pomyślnie usunięte z postu.'
    else
      redirect_to edit_packend_post_path(params[:id]), warning: 'Wystąpił problem, nie można usnąć zdjęcia z postu.'
    end
  end

  def add_image 
    respond_to do |format|
      format.html
      format.js { @images = Image.all }
    end
  end

  private

  def fetch_image
    if !params[:post_image_id].empty? 
      Image.find(params[:post_image_id]) 
    end
  end

  def set_backend_post
    @backend_post = Post.find_by_slug(params[:id])
  end

  def backend_post_params
    params.require(:post).permit(:title, :excerpt, :slug, :image, :publish_date, :publish, :body)
  end

end
