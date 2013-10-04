class RatingsController < ApplicationController
  def index
  	@ratings = Rating.all
    respond_to do |format|
      format.html 
      format.json { render json: @ratings }
  	end
	end
	
	def new
    @rating = Rating.new
    @beers = Beer.all
  end
	
	def create
		rating = Rating.create params[:rating]
		current_user.ratings << rating
		debugger
		redirect_to user_path current_user
	end
	
	def destroy
		rating = Rating.find params[:id]
		rating.delete
		redirect_to :back
	end
	
	def create
		Rating.create params[:rating]

		# talletetaan tehty reittaus sessioon 
		session[:last_rating] = "#{Beer.find(params[:rating][:beer_id])} #{params[:rating][:score]} points"

		redirect_to ratings_path
	end
end
