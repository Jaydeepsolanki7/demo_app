class Bus < ApplicationRecord
  belongs_to :route
  enum :bus_type, [:normal, :ac_sleeper, :sleeper]
end
