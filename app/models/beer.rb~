class Beer < ActiveRecord::Base
  attr_accessible :brewery_id, :name, :style
  
  belongs_to :brewery
  has_many :ratings, :dependent => :destroy
  
  def average_rating
  	result = ratings.inject(0.0) { |sum, r| sum += r.score }
  	result/ratings.count
  	#result = 0.0
  	#for rating in ratings do
  		#result = result + rating.score
  	#end
  	#result/ratings.count 	
  end
  
  def to_s
  	"Olut #{name}, panimo #{brewery.name}" 
  end
      	
end
