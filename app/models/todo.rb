class Todo < ApplicationRecord
  belongs_to :admin_user

  validates :title,   presence: true, uniqueness: true
  validates :content, presence: true
  validates :image,   presence: true
end
