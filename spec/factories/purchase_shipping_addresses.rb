FactoryBot.define do
  factory :purchase_shipping_address do
    user_id { 1 }
    item_id { 1 }
    postal_code { '000-0000' }
    area_info_id { 1 }
    municipality { '丸々市' }
    house_number { '１丁目' }
    buildingname { 'ハイツ' }
    phone_number { 09011112222 }
  end
end
