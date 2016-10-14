class User < ActiveRecord::Base
  has_many :trips
  has_many :destinations, through: :trips

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(email, password_attempt)
    current_user = User.find_by(email: email)
    if current_user && current_user.password == password_attempt
      return current_user
    end
    nil
  end

end
