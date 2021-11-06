FactoryBot.define do
  factory :product do
    product_name { 'いろいろ' }
    product_discription { Faker::Lorem.sentence }
    product_category_id { 2 }
    product_condition_id { 2 }
    shipping_burden_id { 2 }
    shipping_area_id { 2 }
    days_to_ship_id { 2 }
    purchase_price { Faker::Number.between(from: 300, to: 9_999_999) }

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    association :user
  end
end
