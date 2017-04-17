class User < ApplicationRecord
  has_many :comments
  has_many :votes
  has_many :questions
  has_many :answers


  validates_presence_of :username, :email, :hashed_password
  validates_uniqueness_of :email

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    return user if user && user.password == password
  end
end
