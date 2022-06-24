FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name { Gimei.family }
    first_name { Gimei.given }
    last_name_jp { Gimei.family.katakana }
    first_name_jp { Gimei.given.katakana }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end