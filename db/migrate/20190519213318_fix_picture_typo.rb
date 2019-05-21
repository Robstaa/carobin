class FixPictureTypo < ActiveRecord::Migration[5.2]
  def change
    rename_column :pictures, :plaace_picture, :place_picture
  end
end
