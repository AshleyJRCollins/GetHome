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
    if @review.save
      RideChannel.broadcast_to(
        @ride,
        render_to_string(partial: "shared/journey_completed", locals: { ride: @ride })
      )
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
