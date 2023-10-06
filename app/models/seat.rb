class Seat < ApplicationRecord
  belongs_to :bus
  has_many :bookings
  validates :seat_no , presence: true

end
