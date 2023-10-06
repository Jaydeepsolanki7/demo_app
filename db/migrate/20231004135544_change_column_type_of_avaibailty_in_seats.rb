class ChangeColumnTypeOfAvaibailtyInSeats < ActiveRecord::Migration[7.0]
  def change
    change_column :seats, :availablity, :boolean
  end
end
