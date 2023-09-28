class CreateRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :routes do |t|
      t.string :destination
      t.string :starting_point
      t.integer :distance

      t.timestamps
    end
  end
end
