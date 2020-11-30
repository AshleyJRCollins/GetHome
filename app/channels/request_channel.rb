class RequestChannel < ApplicationCable::Channel
  def subscribed
    request = Request.find(params[:id])
    stream_for request
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
