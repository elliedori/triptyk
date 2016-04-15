require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  # Remember to create a migration!
  validates_presence_of :first_name, :last_name, :email, :username, :password

  validates :email, :username, uniqueness: true

  # validates :password, limit: { minimum: 8 }

  has_many :tweets
  # people that follow this user
  has_many :followers, through: :relationships, class_name: "User"
  # people that this user follows
  has_many :followees, through: :relationships, class_name: "User"

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
