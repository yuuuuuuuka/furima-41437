FactoryBot.define do
  factory :order do
    name                        { Faker::Name.first_name }
    email                       { Faker::Internet.email }
    password                     { Faker::Internet.password(min_length: 6) + '1a' }
    password_confirmation        { password }
    birthday { Faker::Date.birthday }
    first_name                  { '山田' }
    last_name                   { '太郎' }
    kana_first_name             { 'ヤマダ' }
    kana_last_name              { 'タロウ' }
    name                        { Faker::Commerce.product_name }
    explanation                 { Faker::Lorem.sentence }
    price                       { Faker::Number.between(from: 300, to: 9_999_999) }
    category_id                 { (2..11).to_a.sample }
    item_situation_id           { (2..7).to_a.sample }
    load_id                        { (2..2).to_a.sample }
    prefecture_id                  { (2..48).to_a.sample }
    shipping_location_id           { (2..4).to_a.sample }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
