class User < ActiveRecord::Base
  has_many :trips
  has_many :destinations, through: :trips
end
