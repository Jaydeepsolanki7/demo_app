class AddColumnInRoutes < ActiveRecord::Migration[7.0]
  def change
    add_column :routes, :route_name, :string
  end
end
