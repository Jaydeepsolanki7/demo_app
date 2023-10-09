class AddColumnDateInBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :reservations, :reservation_date, :datetime
  end
end
