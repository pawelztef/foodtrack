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
    respond_to do |format|
      format.html
      format.js { @images = Image.all }
    end
  end

  def create
    msg = 'Post został zapisany.'
    @title = 'Edycja postu'
    @backend_post = Post.new(backend_post_params)
    respond_to do |format|
      if @backend_post.save
        if params[:publish_on_facebook] == '1' && @backend_post.valid?
          begin
            @fpost = Fpost.new
            @fpost.title = @backend_post.title
            @fpost.link_url = root_url + "aktualności/" + @backend_post.slug  
            posted = post_blog_link_to_timeline(@fpost) 
            @fpost.facebook_id = posted['id']
            @fpost.save
          rescue
            msg = 'Niestety post nie został umieszczony an osi czasu Facebook. Spróbuj ponownie lub skontaktuj się z administratorem servera.' 
          end
        end
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
    respond_to do |format|
      if @backend_post.update(backend_post_params)
        format.html { redirect_to backend_posts_url, notice: msg }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    msg = 'Post został unięty.' 
    @backend_post.destroy
    respond_to do |format|
      format.html { redirect_to backend_posts_url, notice: msg }
    end
  end


  private


  def set_backend_post
    @backend_post = Post.find_by_slug(params[:id])
  end

  def backend_post_params
    params.require(:post).permit(:facebook, 
                                 :title, 
                                 :excerpt, 
                                 :slug, 
                                 :image, 
                                 :publish_date, 
                                 :draft, 
                                 :body)
  end

end
