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
      redirect_to new_ride_review_path(@ride)
    end
  end

  def show
    @ride = Ride.find(params[:id])
  end
end
