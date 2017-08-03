class CreateShoes < ActiveRecord::Migration[5.1]
  def change
    create_table :shoes do |t|
      t.string :model
      t.string :brand
      t.string :isbn
      t.string :sku
      t.integer :release_year
      t.date :edition_date

      t.timestamps
    end
  end
end
