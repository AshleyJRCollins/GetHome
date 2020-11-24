class Ride < ApplicationRecord
  belongs_to :user
  belongs_to :request
  validates :user, uniqueness: { scope: :request }
end
