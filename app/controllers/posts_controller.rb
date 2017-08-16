class PostsController < ApplicationController
  include Reuseable
  def index
    @posts = Post.where(draft: false).order(publish_date: :desc)
    @post_page = safe_find("BlogPage")
  end

  def show
    @post = Post.find_by_slug(params[:id])
    @post_page = safe_find("BlogPage")
    @last_posts = Post.where(draft: false).order(publish_date: :desc).first(3)
  end
end
