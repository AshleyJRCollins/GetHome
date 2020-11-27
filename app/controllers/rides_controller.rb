class RidesController < ApplicationController
  def index
    @rides = Ride.all
  end

  def create
    @ride = Ride.new
    @ride.user = current_user
    @request = Request.find(params[:request_id])
    @ride.request = @request
    @ride.save
    @request.confirmed!
    redirect_to ride_path(@ride)
  end

  def update
    @ride = Ride.find(params[:id])
    if @ride.update(completed: true)
      redirect_to rides_path
    end

  end

  def show
    @ride = Ride.find(params[:id])
  end
end
