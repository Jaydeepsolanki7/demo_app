class AddColumnDateTimeToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :booking_date, :datetime
  end
end
