class AddEnumToSeats < ActiveRecord::Migration[7.1]
  def change
    add_column :seats, :status, :string, default: 'available'
  end
end
