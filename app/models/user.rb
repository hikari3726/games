class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }, uniqueness: true
  VALID_PASSWORED_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}
  validates :description, length: {maximum: 300 }
  
  has_secure_password
end
