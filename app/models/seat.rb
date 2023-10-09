class Seat < ApplicationRecord
  belongs_to :bus
  has_one :reservation
  validates :seat_no , presence: true
  enum status: {available: 'available', booked: 'booked'}, _default: 'available'
end
