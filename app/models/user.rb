class User < ActiveRecord::Base
	include RatingAverage
  attr_accessible :username
  
  has_many :ratings   # käyttäjällä on monta ratingia
  has_many :beers, :through => :ratings
end
