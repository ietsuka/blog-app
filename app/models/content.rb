class Content < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title,
    presence: true
  validates :script,
    presence: true
end
