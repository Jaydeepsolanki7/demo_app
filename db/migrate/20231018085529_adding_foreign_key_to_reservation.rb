class AddingForeignKeyToReservation < ActiveRecord::Migration[7.1]
  def change
    add_reference :reservations, :bus, foreign_key: true
  end
end
