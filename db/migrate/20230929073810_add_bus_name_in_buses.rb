class AddBusNameInBuses < ActiveRecord::Migration[7.0]
  def change
    add_column :buses, :bus_name, :string
  end
end
