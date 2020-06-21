

class User < ActiveRecord::Base
  has_many :todos 
  has_secure_password 
  validates_uniqueness_of :username
  validates_presence_of :firstname, :lastname, :username, :password_digest 
  validates_length_of :password_digest, {minimum: 8, maximun: 32}
end