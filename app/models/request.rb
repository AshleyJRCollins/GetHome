class Request < ApplicationRecord
  belongs_to :user
  validates :starting_location, :ending_location, presence: true

  after_validation :geocode

  def geocode
    starting = Geocoder.search(starting_location).first
    ending = Geocoder.search(ending_location).first
    lat_start, long_start = [starting.latitude, starting.longitude]
    lat_end, long_end = [ending.latitude, ending.longitude]
    self.start_latitude = lat_start
    self.start_longitude = long_start
    self.end_latitude = lat_end
    self.end_longitude = long_end
  end
end
