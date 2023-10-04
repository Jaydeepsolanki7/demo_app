class AddDetailsToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :user_names, :string
    add_column :bookings, :booked_seat, :integer
  end
end
