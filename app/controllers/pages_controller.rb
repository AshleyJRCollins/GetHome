class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  	@navbar_white = true
  end
end
