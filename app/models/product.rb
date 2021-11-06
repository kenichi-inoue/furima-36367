class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :product_category
  belongs_to :product_condition
  belongs_to :shipping_burden
  belongs_to :shipping_area
  belongs_to :days_to_ship
  belongs_to :user
  has_one :purchase
  # has_one_attached :purchase
  has_one_attached :image

  validates :product_name, presence: true
  validates :product_discription, presence: true
  validates :product_category_id, presence: true
  validates :product_condition_id, presence: true
  validates :shipping_burden_id, presence: true
  validates :shipping_area_id, presence: true
  validates :days_to_ship_id, presence: true
  validates :purchase_price, presence: true
  validates_inclusion_of :purchase_price, in: 300..9_999_999

  validates :image, presence: true

  validates :product_category_id, numericality: { other_than: 1, message: 'is not included in the list' }
  validates :product_condition_id, numericality: { other_than: 1, message: 'is not included in the list' }
  validates :shipping_burden_id, numericality: { other_than: 1, message: 'is not included in the list' }
  validates :shipping_area_id, numericality: { other_than: 1, message: 'is not included in the list' }
  validates :days_to_ship_id, numericality: { other_than: 1, message: 'is not included in the list' }
end
