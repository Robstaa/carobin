class AddRatingToPlace < ActiveRecord::Migration[5.2]
  def change
    add_column :places, :rating, :integer
  end
end
