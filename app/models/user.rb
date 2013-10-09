class User < ActiveRecord::Base
	include RatingAverage
  attr_accessible :username, :password, :password_confirmation
  has_secure_password
  
  has_many :ratings, :dependent => :destroy
  has_many :beers, :through => :ratings

  validates_uniqueness_of :username
  validates_length_of :password, :minimum => 3
  validates :username, length: { maximum: 15,
   #                         too_long: "sallittu maksimi %{count} merkkiä"
  }

end
