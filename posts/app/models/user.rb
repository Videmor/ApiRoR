class User < ActiveRecord::Base
  has_secure_password

  has_many :posts

  before_create :generate_token


  def self.authenticate username, password
    user = User.find_by username: username

    user && user.authenticate(password)
  end

  private

  def generate_token
    return if auth_token?
    begin
      self.auth_token = SecureRandom.hex
    end while User.exists?(auth_token: self.auth_token)
  end


end
