class Ride < ApplicationRecord
  belongs_to :user
  belongs_to :request
  has_many :reviews
  validates :user, uniqueness: { scope: :request }
end
