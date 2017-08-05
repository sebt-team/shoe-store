class Shoe < ApplicationRecord
  validates :brand, :model, :isbn, :release_year, :sku,  presence: true
  validates :sku, :release_year, numericality: true
end
