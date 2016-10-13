class User < ActiveRecord::Base

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: { with: }
  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true
  validates :password_digest, presence: true

end
