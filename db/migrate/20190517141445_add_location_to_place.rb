class AddLocationToPlace < ActiveRecord::Migration[5.2]
  def change
    add_column :places, :location, :string
  end
end
