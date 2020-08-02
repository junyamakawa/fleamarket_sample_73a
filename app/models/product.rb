class Product < ApplicationRecord
  enum status: { sale: 0, sold: 1 }
  belongs_to :user
end
