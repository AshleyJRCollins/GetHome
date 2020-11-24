class RequestsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @requests = Request.all
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    if @request.save
      redirect_to request_path(@request)
    else
      render :new
    end
  end

  def show
  end

  private

  def request_params
    params.require(:request).permit(:starting_location, :ending_location)
  end
end
