class AddReservationDateToNowColumnFromReservations < ActiveRecord::Migration[7.1]
  def change
    add_column :reservations, :reservation_date, :datetime, default: DateTime.now
  end
end
