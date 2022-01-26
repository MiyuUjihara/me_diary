class Photo < ApplicationRecord
  belongs_to :diary

  mount_uploader :image, ImageUploader
end
