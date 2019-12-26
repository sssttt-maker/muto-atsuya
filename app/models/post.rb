class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  enum published: { draft: false, published: true }

  def thumbnail
    return self.image.variant(combine_options: { resize: "400x400>", extent: "200x200", background: "white", gravity: "center"})
  end

  def mini_thumbnail
    return self.image.variant(combine_options: { resize: "120x120", extent: "80x80", background: "white", gravity: "center"})
  end
end
