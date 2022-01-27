class Column < ApplicationRecord
  belongs_to :admin_users
  mount_uploader :image, ImageUploader
end
