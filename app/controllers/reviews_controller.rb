class ReviewsController < ApplicationController
  def new
  end

  def create
  	@ride = ride.find(params[:ride_id])
  	@review = Review.new(review_params)
  	@review.ride = @ride
  	if @review.save 
  		link_to 'submit', root_path
  	else 
  		render :new
  	end
  end

  private 


  def review_params
  	params.require(:review).permit(:rating, :content)
  end
end
