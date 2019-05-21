class RenameUrlToPlacePicture < ActiveRecord::Migration[5.2]
  def change
    rename_column :pictures, :url, :plaace_picture
  end
end
