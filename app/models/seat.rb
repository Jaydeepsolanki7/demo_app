class Seat < ApplicationRecord
  belongs_to :bus
  belongs_to :reservation, optional: true
  validates :seat_no , presence: true
  enum status: {available: 'available', booked: 'booked'}, _default: 'available'

  accepts_nested_attributes_for :reservation, allow_destroy: true, reject_if: :all_blank
  
  # def seat_price(selected)
  # end
end
