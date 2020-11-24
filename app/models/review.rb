class Review < ApplicationRecord
  belongs_to :ride
  validates :rating, inclusion: { in: 1..5 }
end
