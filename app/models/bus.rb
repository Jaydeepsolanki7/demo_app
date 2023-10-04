class Bus < ApplicationRecord
  validates :departure_date, presence: :true
  validates :bus_arrival, presence: :true
  validates :bus_destination, presence: :true

  belongs_to :route
  has_many :seats, dependent: :destroy
  has_many :users, through: :booking
  enum :bus_type, [:normal, :ac_sleeper, :sleeper]
end
