class User < ActiveRecord::Base

  has_many :review

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i  }
  validates :password, confirmation: true

  has_secure_password

end
