class Comment < ApplicationRecord
  belongs_to :content
  validates :name,
    presence: true
  validates :comment,
    presence: true
end
