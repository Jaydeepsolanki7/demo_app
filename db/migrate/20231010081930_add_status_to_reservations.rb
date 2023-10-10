class AddStatusToReservations < ActiveRecord::Migration[7.1]
  def change
    add_column :reservations, :reservation_status, :integer, default: 0
  end
end
