class CreateBuses < ActiveRecord::Migration[7.0]
  def change
    create_table :buses do |t|
      t.integer :bus_type
      t.integer :capacity
      t.time :departure_time
      t.time :arrival_time
      t.decimal :rating, precision: 1, scale: 1
      t.integer :seat_price
      t.boolean :available
      t.references :route, null: false, foreign_key: true

      t.timestamps
    end
  end
end
