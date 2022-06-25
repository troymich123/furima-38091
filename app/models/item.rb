class Item < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :days_until_delivery
  has_one_attached :image

  validates :image, presence: true
  validates :product_name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  with_options presence: true, numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :delivery_charge_id
    validates :prefecture_id
    validates :days_until_delivery_id
  end
  validates :price, presence: true,
                    numericality: { only_integer: true, allow_blank: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
