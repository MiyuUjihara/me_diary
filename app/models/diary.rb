class Diary < ApplicationRecord
  belongs_to :user
  
  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos, allow_destroy: true

  validates :caption, presence: true
  validates :date,  presence: true


  def get_title
    return self.title.blank? ?  "no_title" : self.title
  end

  def get_image_url
    return self.photos.first.blank? ? 'noimage.png' : self.photos.first.image.url
  end
end