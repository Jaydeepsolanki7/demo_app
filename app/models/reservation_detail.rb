class ReservationDetail < ApplicationRecord
  belongs_to :reservation
  enum gender: {male: "male", female: "female", other: "other"}
end
