class RemovePlacePictureFromPictures < ActiveRecord::Migration[5.2]
  def change
    remove_column :pictures, :place_picture, :string
  end
end
