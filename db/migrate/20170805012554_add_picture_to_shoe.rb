class AddPictureToShoe < ActiveRecord::Migration[5.1]
  def change
  	add_attachment :shoes, :picture
  end
end
