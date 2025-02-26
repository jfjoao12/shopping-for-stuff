class Product < ApplicationRecord
  validates :name, :price_cents, :description, presence: true
  validates :price_cents, numericality: { only_integer: true }
end
