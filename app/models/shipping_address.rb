class ShippingAddress < ApplicationRecord
  validates :postal_code, presence: true
  validates :municipality, presence: true
  validates :house_number, presence: true
  validates :phone_number, presence: true

  validates :area_info_id, numericality: { other_than: 1, message: "can't be blank" } 
end
