class Product < ApplicationRecord
  enum status: { sale: 0, sold: 1 }
end
