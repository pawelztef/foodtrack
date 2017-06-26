class Backend::PostsController < ApplicationController
  before_action :set_backend_post, only: [:show, :edit, :update, :destroy]
  layout 'backend_layout'

  # GET /backend/posts
  # GET /backend/posts.json
  def index
    @backend_posts = Post.all
    @title = "Lista Postów"
  end

  # GET /backend/posts/1
  # GET /backend/posts/1.json
  def show
  end

  # GET /backend/posts/new
  def new
    @backend_post = Post.new
    @title = 'Nowy post'
  end

  # GET /backend/posts/1/edit
  def edit
    @title = 'Edycja postu'
  end

  # POST /backend/posts
  # POST /backend/posts.json
  def create
    @backend_post = Post.new(backend_post_params)

    respond_to do |format|
      if @backend_post.save
        format.html { redirect_to backend_posts_url, notice: 'Post was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /backend/posts/1
  # PATCH/PUT /backend/posts/1.json
  def update
    respond_to do |format|
      if @backend_post.update(backend_post_params)
        format.html { redirect_to backend_posts_url, notice: 'Post was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /backend/posts/1
  # DELETE /backend/posts/1.json
  def destroy
    @backend_post.destroy
    respond_to do |format|
      format.html { redirect_to backend_posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_backend_post
      @backend_post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def backend_post_params
      params.require(:post).permit(:title, :publish_date, :publish, :body)
    end
end
