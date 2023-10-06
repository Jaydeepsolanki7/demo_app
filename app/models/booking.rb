class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :bus
  belongs_to :seat
end
