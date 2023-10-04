class Seat < ApplicationRecord
  belongs_to :bus
  has_many :bookings
  enum :status, [:seat_available, :seat_unavailable]
  validates :seat_no , presence: true, uniqueness: true
end
