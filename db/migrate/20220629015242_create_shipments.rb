class CreateShipments < ActiveRecord::Migration[6.0]
  def change
    create_table :shipments do |t|
      t.string        :postcode,      null: false
      t.integer       :prefecture,    null: false
      t.string        :city,          null: false
      t.string        :street,        null: false
      t.string        :address_other
      t.string        :phone_num,     null: false
      t.references    :order,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
