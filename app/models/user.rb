class User < ApplicationRecord
  has_secure_password
  has_many :contents
  validates :name,
    presence: true,
    uniqueness: true
  validates :email,
    presence: true,
    uniqueness: true
  validates :password_digest,
    presence: true,
    uniqueness: true
end
