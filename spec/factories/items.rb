FactoryBot.define do
  factory :item do
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('/Users/r3e5id03/Pictures/01 2/bana1.jpg'), filename: 'bana1.jpg')
    end

    itemname          {Faker::Name.initials(number: 2)}
    itemdescription   {Faker::Lorem.sentence}
    category_id       {2}
    itemstatus_id     {2}
    burden_id         {2}
    area_info_id      {2}
    days_to_send_id   {2}
    price             {3333}
  end
end
