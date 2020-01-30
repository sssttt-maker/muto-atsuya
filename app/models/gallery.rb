class Gallery < ApplicationRecord
  has_many :gallery_category_relations, dependent: :destroy
  has_many :categories, through: :gallery_category_relations
  has_many_attached :images

  validate :images_presence

  def images_presence
    if images.attached?
      images.each.each do |image|
        if !image.content_type.in?(%('image/jpeg image/png image/jpg'))
          errors.add(:images, 'にはjpeg, jpgまたはpngファイルを添付してください')
        end
      end
    else
      errors.add(:images, 'ファイルを添付してください')
    end
  end
end
