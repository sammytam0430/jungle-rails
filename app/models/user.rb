class User < ActiveRecord::Base

  has_many :review

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: { case_sensitive: false }, format: { with: /.+@.+/ }
  validates :password, length: { minimum: 6 }, confirmation: true
  validates :password_confirmation, presence: true

  has_secure_password

end
