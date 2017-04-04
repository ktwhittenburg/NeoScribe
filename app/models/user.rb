class User < ApplicationRecord
  #ensures uniqueness
  before_save { self.email = email.downcase }
  #a valid username is <=127 chars long
  validates :name,  presence: true, length: { maximum: 127 }
  #a valid e-mail is no more than 255 chars long (overflow for many databases)
  #it must also match the standard e-mail format, see regex below
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }
end
