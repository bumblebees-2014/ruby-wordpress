class User < ActiveRecord::Base
	include BCrypt

  validates :username, uniqueness: true
  validates :password, presence: true, length: {minimum: 5}
  
	has_many :articles
	has_many :comments
	has_secure_password
end
