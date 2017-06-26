class PostsController < ApplicationController
  def index
    @posts = Post.where(publish: true).order(publish_date: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end
end
