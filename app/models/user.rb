class User < ActiveRecord::Base
  attr_accessible :username
  
  has_many :ratings   # käyttäjällä on monta ratingia
end
