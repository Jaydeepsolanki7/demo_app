class RemoveColumnFromReservations < ActiveRecord::Migration[7.1]
  def change
    remove_column :reservations, :reservation_date
  end
end
