class AvailableTrueInSeats < ActiveRecord::Migration[7.0]
  def change
    def up
      change_column :profiles, :show_attribute, :boolean, default: true
    end
    
    def down
      change_column :profiles, :show_attribute, :boolean, default: nil
    end
  end
end
