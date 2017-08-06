class Shoe < ApplicationRecord
  validates :brand, :model, :isbn, :release_year, :sku,  presence: true
  validates :sku, :release_year, numericality: true
  belongs_to :brand
  mount_uploader :photo, PhotoUploader
end
