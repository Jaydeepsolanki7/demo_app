class AddPriceInSeats < ActiveRecord::Migration[7.1]
  def change
    add_column :seats, :seat_price, :integer
  end
end
