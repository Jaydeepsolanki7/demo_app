class AddColumnInSeats < ActiveRecord::Migration[7.0]
  def change
    add_column :seats, :availablity, :boolean, default: true
  end
end
