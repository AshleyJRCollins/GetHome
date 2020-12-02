class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @ride = Ride.find(params[:ride_id])
  end

  def create
    @ride = Ride.find(params[:ride_id])
    @review = Review.new(review_params)
    @review.ride = @ride
    @review.user = current_user
    @ride.completed = true
    if @review.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
