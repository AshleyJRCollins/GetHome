class Review < ApplicationRecord
  belongs_to :ride
  belongs_to :user
  validates :rating, inclusion: { in: 1..5 }
end
