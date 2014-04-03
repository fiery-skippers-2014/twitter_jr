class User < ActiveRecord::Base
  has_many :tweets
  has_many :followers
  # Remember to create a migration!


end
