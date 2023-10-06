class RemoveColumnFromSeats < ActiveRecord::Migration[7.0]
  def change
    remove_column :seats, :availablity
  end
end
