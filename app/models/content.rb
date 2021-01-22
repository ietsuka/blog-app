class Content < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments, dependent: :destroy
  validates :title,
    presence: true
  validates :script,
    presence: true
  validates :thumbnail,
    uniqueness: { message: "の名前は既に使われています。名前を変更お願いします。" }
end
