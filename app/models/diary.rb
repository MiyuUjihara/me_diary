class Diary < ApplicationRecord
  belongs_to :user
  
  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos, allow_destroy: true

  validates :caption, presence: true
  validates :date,  presence: true
end
