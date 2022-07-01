FactoryBot.define do
  factory :order_shipment do
    postcode { '123-4567' }
    prefecture_id { Faker::Number.within(range: 2..48) }
    city { Gimei.city.kanji }
    street { Gimei.town.kanji }
    address_other { Gimei.town.kanji }
    phone_num { Faker::PhoneNumber.subscriber_number(length: 11) }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
