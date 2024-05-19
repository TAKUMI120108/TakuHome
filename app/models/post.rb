class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :customer
  validates :address, presence: true
  validates :comment, presence: true
  validates :star, presence: true
end
