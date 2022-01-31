class Diary < ApplicationRecord
  belongs_to :user

  validates :caption, presence: true
  validates :date,  presence: true

  mount_uploader :image, ImageUploader

  def get_title
    return self.title.blank? ?  "no_title" : self.title
  end

  def get_image_url
    return self.image.blank? ? 'noimage.png' : self.image.url
  end

  def edit_image_url
    return self.id.blank? ? 'noimage.png' : self.image.url
  end
end