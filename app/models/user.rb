class User < ActiveRecord::Base
  include RatingAverage
  attr_accessible :username, :password, :password_confirmation
  has_secure_password

  has_many :ratings, :dependent => :destroy
  has_many :beers, :through => :ratings

  validates_uniqueness_of :username
  validates_length_of :password, :minimum => 3
  validates :password, :format => {:with => /[a-zA-Z0-9]*[0-9]+[a-zA-Z0-9]*/}
  validates :username, length: {maximum: 15,
                                #                         too_long: "sallittu maksimi %{count} merkkiä"
  }

  def favorite_beer
    return nil if ratings.empty?
    ratings.sort_by { |r| r.score }.last.beer
  end

  #def favorite_style
  #  return nil if ratings.empty?
  #  styleratings = []
  #
  #  :ratings.each do |rating|
  #
  #  end
  #end
end
