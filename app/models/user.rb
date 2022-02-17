class User < ApplicationRecord
  has_secure_password
  has_many :diaries, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :name,  presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, length: {minimum: 6 }

  def liked_by?(column_id)
    likes.where(column_id: column_id).exists?
  end
  
end
