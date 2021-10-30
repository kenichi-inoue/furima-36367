class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :product_category
  belongs_to_active_hash :product_condition
  belongs_to_active_hash :shipping_burden
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :days_to_ship
  belongs_to :user
  # has_one :purchase
  has_one_attached :purchase

  validates :product_name, presence: true
  validates :product_discription, presence: true
  validates :product_category_id, presence: true
  validates :product_condition_id, presence: true
  validates :shipping_burden_id, presence: true
  validates :shipping_area_id, presence: true
  validates :days_to_ship_id, presence: true
  validates :purchase_price, presence: true
  validates_inclusion_of :purchase_price, in:300..9999999



end
