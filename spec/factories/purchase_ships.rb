FactoryBot.define do
  factory :purchase_ship do
    postal_code { '615-8077' }
    shipping_area_id { 2 }
    city { '京都市左京区' }
    street { '桂' }
    building { 'コーポ' }
    phone { '07539453333' }
    token { '01234567' }
  end
end
