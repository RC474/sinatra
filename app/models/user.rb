

class User < ActiveRecord::Base
  has_many :todos 
  validates_uniqueness_of :username
end