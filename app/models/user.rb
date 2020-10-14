class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{8,20}\z/
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            # 大文字小文字考慮
            uniqueness: { case_sensitive: false }
            # uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }

end
