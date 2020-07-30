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

  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :condition_id, presence: true
  validates :delivery_cost_id, presence: true
  validates :region_id, presence: true
  validates :preparation_day_id, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :user_id, presence: true
end

