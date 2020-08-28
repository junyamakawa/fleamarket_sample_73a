class Category < ApplicationRecord
  has_many :product_categories, dependent: :destroy
  has_many :products
  has_ancestry 
end