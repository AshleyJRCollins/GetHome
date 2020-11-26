# require 'google_maps_service'

# class GoogleMapsDirections
#  def initialize(coordinates)
#   @gmaps = GoogleMapsService::Client.new(key: ENV['GOOGLE_MAPS_KEY'])
#   @coordinates = coordinates
#  end

#  def request_directions
#   routes = @gmaps.directions(
#     @coordinates.first,
#     @coordinates.last,
#     mode: 'driving',
#     alternatives: false)
#  end
# end
