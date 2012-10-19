class DeleteBrandFromShoe < ActiveRecord::Migration[5.1]
  def change
  	remove_column :shoes, :brand 
  	add_reference :shoes, :brand, foreign_key: true
  end
end
