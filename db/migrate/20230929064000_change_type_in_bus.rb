class ChangeTypeInBus < ActiveRecord::Migration[7.0]
  def change
    change_column :buses, :departure_date, :date
    change_column :buses, :arrival_date, :date
  end
end
