class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :seat
  enum :reservation_status, [:pending, :accepted, :rejected]
  enum gender: {male: "male", female: "female", other: "other"}
  validates :user_email, presence: true, on: :save
  validates :user_name, presence: true, on: :save
end
