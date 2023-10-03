class RemoveColumnFromRoutes < ActiveRecord::Migration[7.0]
  def change
    remove_column :routes, :destination, :string
    remove_column :routes, :starting_point, :string
  end
end
