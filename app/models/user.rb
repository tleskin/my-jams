class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  has_many :songs
  has_secure_password

  enum role: %w(default admin)

  # def admin?
  #   role == "admin"
  # end
end
