class PostsController < ApplicationController
  def index
    @posts = Post.where(draft: false).order(publish_date: :desc)
  end

  def show
    @post = Post.find_by_slug(params[:id])
  end
end
