class CreateReservationDetails < ActiveRecord::Migration[7.1]
  def change
    create_table :reservation_details do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.string :email
      t.references :reservation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
