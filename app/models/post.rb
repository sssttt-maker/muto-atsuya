class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  def thumbnail
    return self.image.variant(combine_options: { resize: "400x400>", extent: "200x200", background: "white", gravity: "center"})
  end
end
