class Seat < ApplicationRecord
  belongs_to :bus
  enum :status, [:seat_available, :seat_unavailable]
end
