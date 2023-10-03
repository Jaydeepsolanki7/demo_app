class ChangeColumnInTable < ActiveRecord::Migration[7.0]
  def change
    change_column :buses, :departure_date, :date
  end
end
