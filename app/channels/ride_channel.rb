class RideChannel < ApplicationCable::Channel
  def subscribed
    ride = Ride.find(params[:id])
    stream_for ride
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
