class ChangeTypeInBuses < ActiveRecord::Migration[7.0]
  def change
    change_column :buses, :departure_date, :datetime
    change_column :buses, :arrival_date, :datetime
  end
end
