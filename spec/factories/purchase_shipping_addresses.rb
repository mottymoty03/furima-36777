FactoryBot.define do
  factory :purchase_shipping_address do
    postal_code { '000-0000' }
    area_info_id { 2 }
    municipality { '丸々市' }
    house_number { '１丁目' }
    buildingname { 'ハイツ' }
    phone_number { '09011112222' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
