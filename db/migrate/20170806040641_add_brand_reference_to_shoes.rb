class AddBrandReferenceToShoes < ActiveRecord::Migration[5.1]
  def change
    remove_column :shoes, :brand, :string
    add_reference :shoes, :brand    
  end
end
