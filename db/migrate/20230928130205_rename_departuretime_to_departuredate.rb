class RenameDeparturetimeToDeparturedate < ActiveRecord::Migration[7.0]
  def change
    rename_column :buses, :departure_time, :departure_date
  end
end
