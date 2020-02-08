class TopsController < ApplicationController
  layout 'top'
  def index
    @galleries = Gallery.all.limit(8)
    @posts = Post.published.limit(3)
  end
end
