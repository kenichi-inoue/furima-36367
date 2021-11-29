class PurchaseShip
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :postal_code, :shipping_area_id, :city, :street, :building, :phone, :token

  with_options presence: true do
    validates :user_id
    validates :product_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :shipping_area_id, numericality: { other_than: 1, message: 'is not included in the list' }
    validates :city
    validates :street
    validates :token
    validates :phone, length: { in: 10..11 }
  end
  validates :phone, format: { with: /\A[0-9]+\z/, message: 'is valid only for half-width number' }

  def save
    purchase = Purchase.create(user_id: user_id, product_id: product_id)
    Ship.create(postal_code: postal_code, shipping_area_id: shipping_area_id, city: city, street: street, building: building,
                phone: phone, purchase_id: purchase.id)
  end
end
