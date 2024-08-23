FactoryBot.define do
  factory :user do
    name                        { Faker::Name.first_name }
    email                       { Faker::Internet.email }
    password                     { Faker::Internet.password(min_length: 6) }
    password_confirmation        { password }
    birthday { Faker::Date.birthday }
    first_name                  { '山田' }
    last_name                   { '太郎' }
    kana_first_name             { 'ヤマダ' }
    kana_last_name              { 'タロウ' }
  end
end
