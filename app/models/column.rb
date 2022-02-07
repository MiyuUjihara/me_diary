class Column < ApplicationRecord
  has_rich_text :content
  belongs_to :admin_user
  mount_uploader :image, ImageUploader


  validates :title,   presence: true, uniqueness: true
  validates :content, presence: true
  validates :image,   presence: true
end
