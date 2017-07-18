class Backend::PostsController < ApplicationController
  include FacebookConnections
  before_action :authenticate_admin!
  before_action :set_backend_post, only: [:show, :edit, :update, :destroy]
  before_action :retrive_facebook_page, only: [:new, :create, :update, :destroy]
  layout 'backend_layout'

  def index
    @backend_posts = Post.all.order(publish_date: :desc)
    @title = "Lista postów bloga"
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
    if @backend_post.fpost
      params[:facebook_publish] = "1"
    end
    respond_to do |format|
      format.html
      format.js { @images = Image.all }
    end
  end

  def create
    msg = 'Post został zapisany.'
    @title = 'Edycja postu'
    @backend_post = Post.new(backend_post_params)
    @backend_post.image = fetch_image
    if @backend_post.facebook && @backend_post.valid?
      @backend_post.fpost = Fpost.new
      @backend_post.fpost.title = @backend_post.title
      @backend_post.fpost.link_url = root_url + "blog/" + @backend_post.slug
      begin
        posted = post_to_timeline(@backend_post.fpost) 
        @backend_post.fpost.facebook_id = posted['id']
      rescue
        msg = 'Niestety post nie został umieszczony an osi czasu Facebook. Spróbuj ponownie lub skontaktuj się z administratorem servera.' 
      end
    end
    respond_to do |format|
      if @backend_post.save
        format.html { redirect_to backend_posts_url, notice: msg }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @title = 'Edycja postu bloga'
    msg = 'Post został zapisany.'
    @backend_post = Post.find_by_slug(params[:id])
    @backend_post.assign_attributes(backend_post_params)
    @backend_post.image = fetch_image

    @page_graph.delete_object(@backend_post.fpost.facebook_id)
  rescue

    if @backend_post.facebook && @backend_post.valid? 
      @new_fpost = Fpost.new
      @new_fpost.title = backend_post_params[:title]
      @new_fpost.link_url = root_url + "blog/" + backend_post_params[:slug]
      begin
        posted = post_to_timeline(@new_fpost)
        @new_fpost.facebook_id = posted['id']
      rescue
        msg = 'Niestety post nie został umieszczony an osi czasu Facebook. Spróbuj ponownie lub skontaktujs się z administratorem servera.' 
      end
    end
    @backend_post.fpost = @new_fpost

    respond_to do |format|
      if @backend_post.save
        format.html { redirect_to backend_posts_url, notice: msg }
      else
        format.html { render :new }
      end
    end

  end

  def destroy
    msg = 'Post został unięty.' 
    begin
      @page_graph.delete_object(@backend_post.fpost.facebook_id)
    rescue
    ensure
      @backend_post.destroy
      respond_to do |format|
        format.html { redirect_to backend_posts_url, notice: msg }
      end
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
    params.require(:post).permit(:facebook, :title, :excerpt, :slug, :image, :publish_date, :draft, :body)
  end

end
