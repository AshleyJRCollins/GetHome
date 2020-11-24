class Request < ApplicationRecord
  belongs_to :user
  validates :starting_location, :ending_location, presence: true
end
