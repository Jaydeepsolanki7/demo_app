class AddingForeignKeyToSeat < ActiveRecord::Migration[7.1]
  def change
    add_reference :seats, :reservation, foreign_key: true
  end
end
