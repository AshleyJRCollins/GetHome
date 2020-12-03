class RidesController < ApplicationController
  def index
    @rides = Ride.all
  end

  def create
    @request = Request.find(params[:request_id])
    @ride = Ride.new
    @ride.request = @request
    @ride.user = current_user
    if @ride.save
      @request.confirmed!
      RequestChannel.broadcast_to(
        @request,
        render_to_string(partial: "shared/see_your_trips", locals: { request: @request })
      )
      redirect_to ride_path(@ride)
    else
      render 'requests/show'
    end
  end

  def update
    @ride = Ride.find(params[:id])
    if @ride.update(completed: true)
      RideChannel.broadcast_to(
        @ride,
        render_to_string(partial: "shared/journey_completed", locals: { ride: @ride })
      )
      redirect_to new_ride_review_path(@ride)
    end
  end

  def show
    @ride = Ride.find(params[:id])
    @coords = [
      [@ride.request.start_longitude, @ride.request.start_latitude],
      [@ride.request.end_longitude, @ride.request.end_latitude]
    ]
  end
end
