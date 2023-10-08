class RemoveColumnavaFromSeats < ActiveRecord::Migration[7.1]
  def change
    remove_column :seats, :availablity, :integer
  end
end
