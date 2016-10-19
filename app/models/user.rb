class User < ActiveRecord::Base

  has_many :reviews

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: { case_sensitive: false }, format: { with: /.+@.+/ }
  validates :password, length: { minimum: 6 }, confirmation: true
  validates :password_confirmation, presence: true

  has_secure_password

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip.downcase)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

end
