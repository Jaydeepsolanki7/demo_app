class RemoveForeignKeyFromReservations < ActiveRecord::Migration[7.1]
  def change
    remove_reference :reservations, :seat, index:true, foreign_key: true
  end
end
