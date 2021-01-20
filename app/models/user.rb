class User < ApplicationRecord
  has_secure_password
  has_many :contents
  validates :email,
    presence: true
  validates :password_digest,
    presence: true
end
