class CreateVines < ActiveRecord::Migration[5.2]
  def change
    create_table :vines do |t|
      t.string :name
      t.integer :rating

      t.timestamps
    end
  end
end
