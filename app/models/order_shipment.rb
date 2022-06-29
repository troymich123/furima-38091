class OrderShipment
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture, :city, :street, :address_other, :phone_num, :user_id, :item_id

  with_options presence: true do
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}
    validates :city, :street, :phone_num, :user_id, :item_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Shipment.create(postcode: postcode, prefecture: prefecture, city: city, street: street, address_other: address_other, phone_num: phone_num, order_id: order.id)
  end
end