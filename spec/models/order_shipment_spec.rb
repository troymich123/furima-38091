require 'rails_helper'

RSpec.describe OrderShipment, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_shipment = FactoryBot.build(:order_shipment, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '商品購入' do
    context '内容に問題ない場合' do
      it "postcode, prefecture_id, city, street, phone_num, user_id, item_id, tokenがあれば保存できること" do
        expect(@order_shipment).to be_valid
      end

      it "address_otherは空でも購入できること" do
        @order_shipment.address_other = ''
        expect(@order_shipment).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it "postcodeが空では購入できないこと" do
        @order_shipment.postcode = ''
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Postcode can't be blank")
      end

      it "postcodeがハイフン無しでは購入できないこと" do
        @order_shipment.postcode = Faker::Number.number(digits: 7)
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Postcode is invalid. Include hyphen(-)")
      end

      it "prefectureが空では購入できないこと" do
        @order_shipment.prefecture_id = 1
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "cityが空では購入できないこと" do
        @order_shipment.city = ''
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("City can't be blank")
      end

      it "streetが空では購入できないこと" do
        @order_shipment.street = ''
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Street can't be blank")
      end

      it "phone_numが空では購入できないこと" do
        @order_shipment.phone_num = ''
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Phone num can't be blank")
      end

      it "phone_numが9桁以下の半角数値では購入できないこと" do
        @order_shipment.phone_num = Faker::Number.number(digits: 9)
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Phone num is invalid. Must be 10 or 11 digits")
      end

      it "phone_numが12桁以上の半角数値では購入できないこと" do
        @order_shipment.phone_num = Faker::Number.number(digits: 12)
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Phone num is invalid. Must be 10 or 11 digits")
      end

      it "phone_numに半角数字以外が含まれている場合は購入できない" do
        @order_shipment.phone_num = "abcdefghij"
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Phone num is invalid. Must be 10 or 11 digits")
      end

      it "user_idが空では購入できないこと" do
        @order_shipment.user_id = ''
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("User can't be blank")
      end

      it "item_idが空では購入できないこと" do
        @order_shipment.item_id = ''
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Item can't be blank")
      end

      it 'tokenが空では購入できないこと' do
        @order_shipment.token = ''
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end