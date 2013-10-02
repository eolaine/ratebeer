module RatingAverage

	def average_rating
  	result = ratings.inject(0.0) { |sum, r| sum += r.score }
  	result/ratings.count
  end
end
