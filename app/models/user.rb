class User < ApplicationRecord
  validates :name, length: { maximum: 14 }
  # before_save { self.email = email.downcase }   
  # validates :name, presence: true, length: { maximum: 10 }
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i 
  # validates :email, presence: true, length: { maximum: 15 },format: { with: VALID_EMAIL_REGEX },uniqueness: true 
  # has_secure_password
end
