class Column < ApplicationRecord
  enum status: { active: 0, inactive: 1, draft: 2 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  has_rich_text :content
  belongs_to :admin_user
  mount_uploader :image, ImageUploader
  has_many :likes, dependent: :destroy


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

    def status_active
      where(status: "active")
    end
    
    def set_romdom(num)
      self.order("RAND()").limit(num)
    end
  end

end
