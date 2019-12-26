class PostsController < ApplicationController
  def index
    @posts = Post.published.order('created_at DESC').page(params[:page]).per(8)
  end

  def show
    @post = Post.find(params[:id])
    if @post.published?
      @post
    else
      authenticate_user!
      @post
    end
  end
end
