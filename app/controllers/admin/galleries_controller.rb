class Admin::GalleriesController < ApplicationController
  layout 'admin'
  before_action :authenticate_user!

  def index
    @galleries = Gallery.all
  end

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(gallery_params)

    if @gallery.save
      redirect_to galleries_path
    else
      render :new
    end
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy
    redirect_back(fallback_location: root_path, notice: "ギャラリーを削除しました。")
  end

  private

  def gallery_params
    params.require(:gallery).permit(:description, images: [])
  end
end
