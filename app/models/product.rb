class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :order
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  has_many :categories, dependent: :destroy
  accepts_nested_attributes_for :categories, allow_destroy: true
  belongs_to :user
  belongs_to_active_hash :condition
  belongs_to_active_hash :preparation_day
  belongs_to_active_hash :region
  belongs_to_active_hash :delivery_cost
end

