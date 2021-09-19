class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string     :postal_code,           null: false
      t.integer    :area_info_id,          null: false
      t.string     :municipality,          null: false
      t.string     :house_number,          null: false
      t.string     :buildingname
      t.string     :phone_number,          null: false
      t.references :purchase,              null: false, foreign_key: true

      t.timestamps
    end
  end
end
