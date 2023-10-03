class AddJourneyToBuses < ActiveRecord::Migration[7.0]
  def change
    add_column :buses, :bus_destination, :string
    add_column :buses, :bus_arrival, :string
  end
end
