class Product < ApplicationRecord
  belongs_to :user
  # has_one :purchase
  has_one_attached :purchase

end
