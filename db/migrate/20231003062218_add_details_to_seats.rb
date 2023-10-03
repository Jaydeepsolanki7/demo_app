class AddDetailsToSeats < ActiveRecord::Migration[7.0]
  def change
    add_column :seats, :seat_no, :integer
    add_column :seats, :status, :integer 
  end
end
