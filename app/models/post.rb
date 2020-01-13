class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :post_category_relations
  has_many :categories, through: :post_category_relations

  enum published: { draft: false, published: true }

  def thumbnail
    return self.image.variant(combine_options: { resize: "400x400", extent: "200x200", background: "white", gravity: "center"})
  end

  def custom_thumbnail(a, b, c, d)
    return self.image.variant(combine_options: { resize: "#{a}x#{b}", extent: "#{c}x#{d}", background: "white", gravity: "center"})
  end

  def post_thumbnail
    return self.image.variant(combine_options: { resize: "690x460>", extent: "690x460", background: "white", gravity: "center"})
  end

  def mini_thumbnail
    return self.image.variant(combine_options: { resize: "120x120", extent: "80x80", background: "white", gravity: "center"})
  end
end
