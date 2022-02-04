class Column < ApplicationRecord
  belongs_to :admin_users
  mount_uploader :image, ImageUploader

  validates :title,   presence: true, uniqueness: true
  validates :content, presence: true
  validates :image,   presence: true
end
