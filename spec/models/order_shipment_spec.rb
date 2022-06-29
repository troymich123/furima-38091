require 'rails_helper'

RSpec.describe OrderShipment, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_shipment = FactoryBot.build(:order_shipment, user_id: user.id, item_id: item.id)
  end

  describe '商品購入' do
    context '内容に問題ない場合' do
      it "postcode, prefecture, city, street, phone_num, user_id, item_idがあれば保存できること" do
        binding.pry
        expect(@order_shipment).to be_valid
      end

      it "address_otherは空でも保存できること" do
        @order_shipment.address_other = ''
        expect(@order_shipment).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it "postcodeが空では保存できないこと" do
        @order_shipment.postcode = ''
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Postcode can't be blank")
      end

      it "postcodeがハイフン無しでは保存できないこと" do
        @order_shipment.postcode = Faker::Number.number(digits: 7)
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Postcode is invalid. Include hyphen(-)")
      end

      it "prefectureが空では保存できないこと" do
        @order_shipment.prefecture_id = 1
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "cityが空では保存できないこと" do
        @order_shipment.city = ''
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("City can't be blank")
      end

      it "streetが空では保存できないこと" do
        @order_shipment.street = ''
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Street can't be blank")
      end

      it "phone_numが空では保存できないこと" do
        @order_shipment.phone_num = ''
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Phone num can't be blank")
      end

      it "user_idが空では保存できないこと" do
        @order_shipment.user_id = ''
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("User can't be blank")
      end

      it "item_idが空では保存できないこと" do
        @order_shipment.item_id = ''
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end