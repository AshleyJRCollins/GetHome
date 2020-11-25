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
    @request.user = current_user
    if @request.save
      redirect_to request_path(@request)
    else
      render :new
    end
  end

  def show
    @request = Request.find(params[:id])
  end

  def destroy
    @request = Request.find(params[:id])
    @request.destroy

    redirect_to new_request_path
  end

  private

  def request_params
    params.require(:request).permit(:starting_location, :ending_location)
  end
end
