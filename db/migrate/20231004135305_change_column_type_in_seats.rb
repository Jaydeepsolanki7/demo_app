class ChangeColumnTypeInSeats < ActiveRecord::Migration[7.0]
  def change
    rename_column :seats, :status, :availablity
  end
end
