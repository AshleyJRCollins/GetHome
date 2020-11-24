class Ride < ApplicationRecord
  belongs_to :user
  belongs_to :request
end
