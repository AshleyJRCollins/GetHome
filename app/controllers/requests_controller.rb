class RequestsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_request, only: %i[show destroy]

  def index
    @requests = Request.pending
  end

  def show
    @coords = [
      [@request.start_latitude, @request.start_longitude],
      [@request.end_latitude, @request.end_longitude]
    ]
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    @request.user = current_user
    @request.status = "pending"
    if @request.save
      redirect_to request_path(@request)
    else
      render :new
    end
  end

  def destroy
    @request.destroy

    redirect_to new_request_path
  end

  private

  def set_request
    @request = Request.find(params[:id])
  end

  def request_params
    params.require(:request).permit(:starting_location, :ending_location)
  end
end
