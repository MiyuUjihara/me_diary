class Todo < ApplicationRecord
  enum status: { active: 0, inactive: 1, draft: 2 }
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  has_rich_text :content
  belongs_to :admin_user
  has_many :user_todos, dependent: :destroy
  has_many :users, through: :user_todos
  mount_uploader :image, ImageUploader

  validates :title,   presence: true, uniqueness: true
  validates :content, presence: true
  validates :image,   presence: true

  def edit_image_url
    return self.id.blank? ? 'noimage.png' : self.image.url
  end

  class << self
    def search(keyword)
      where(["title like? OR content like?", "%#{keyword}%", "%#{keyword}%"])
    end
  end
  
end
