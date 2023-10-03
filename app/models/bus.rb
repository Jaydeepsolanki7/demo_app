class Bus < ApplicationRecord
  belongs_to :route
  has_many :seats, dependent: :destroy
  enum :bus_type, [:normal, :ac_sleeper, :sleeper]
end
