class AddVisitRefToVine < ActiveRecord::Migration[5.2]
  def change
    add_reference :vines, :visit, foreign_key: true
  end
end
