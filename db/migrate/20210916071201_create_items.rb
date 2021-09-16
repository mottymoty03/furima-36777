class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :itemname,          null: false
      t.text       :itemdescription,   null: false
      t.integer    :category_id,       null: false
      t.integer    :itemstatus_id,     null: false
      t.integer    :burden_id,         null: false
      t.integer    :area_info_id,      null: false
      t.integer    :days_to_send_id,   null: false
      t.integer    :price,             null: false
      t.references :user,              null: false, foreign_key: true

      t.timestamps
    end
  end
end
