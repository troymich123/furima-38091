class OrderShipment
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :street, :address_other, :phone_num, :user_id, :item_id, :token

  with_options presence: true do
    validates :token
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, allow_blank: true, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :city, :street
    validates :user_id
    validates :item_id
    validates :phone_num, format: {with: /\A\d{10,11}\z/, allow_blank: true, message: "is invalid. Must be 10 or 11 digits"}
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Shipment.create(postcode: postcode, prefecture_id: prefecture_id, city: city, street: street, address_other: address_other, phone_num: phone_num, order_id: order.id)
  end
end