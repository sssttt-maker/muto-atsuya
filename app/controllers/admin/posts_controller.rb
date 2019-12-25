class Admin::PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to post_path(@post), notice: "記事を投稿しました。"
    else
      render :new
    end
  end

    def edit
      @post = current_user.posts.find(params[:id])
    end

    def update
      @post = current_user.posts.find(params[:id])
      if @post.update!(post_params)
        redirect_to post_path(@post), notice: "記事を編集しました。"
      else
        render :edit
      end
    end

    def destroy
      @post = current_user.posts.find(params[:id])
      @post.destroy
      redirect_to root_url, notice: "記事「#{@post.title}」を削除しました。"
    end

  private

  def post_params
    params.require(:post).permit(:title, :text, :published, :image)
  end
end
