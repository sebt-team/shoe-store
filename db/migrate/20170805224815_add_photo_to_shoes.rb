class AddPhotoToShoes < ActiveRecord::Migration[5.1]
  def change
    add_column :shoes, :photo, :string
  end
end
