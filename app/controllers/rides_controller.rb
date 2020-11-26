class RidesController < ApplicationController
  def create
    @ride = Ride.new
    @ride.user = current_user
    @request = Request.find(params[:request_id])
    @ride.request = @request
    @ride.save
    @request.confirmed!
    redirect_to ride_path(@ride)
  end

  def show
    @ride = Ride.find(params[:id])
  end
end
