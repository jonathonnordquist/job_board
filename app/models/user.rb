class User < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 70 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: VALID_EMAIL_REGEX,
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
                    
  before_create { self.email = email.downcase }
  
  has_secure_password
end
