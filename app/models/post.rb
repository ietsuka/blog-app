class Post < ApplicationRecord
  belongs_to :user, optional: true
  
  has_many :comments, dependent: :destroy
  has_one_attached :post_image

  validates :title, presence: true
  validates :article, presence: true
end
