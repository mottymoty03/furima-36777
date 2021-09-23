class PurchaseShippingAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :area_info_id, :municipality, :house_number, :buildingname, :phone_number, :purchase_id
  attr_accessor :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality
    validates :house_number
    validates :phone_number
    validates :token
  end
  validates :area_info_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    @purchase = Purchase.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, area_info_id: area_info_id, municipality: municipality, house_number: house_number, buildingname: buildingname, phone_number: phone_number, purchase_id: @purchase.id)
  end
end