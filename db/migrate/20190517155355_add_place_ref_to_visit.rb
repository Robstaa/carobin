class AddPlaceRefToVisit < ActiveRecord::Migration[5.2]
  def change
    add_reference :visits, :place, foreign_key: true
  end
end
