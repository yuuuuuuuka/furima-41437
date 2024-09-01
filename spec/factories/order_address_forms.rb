FactoryBot.define do
  factory :order_address_form do
    postal_code     { "#{rand(100..999)}-#{rand(1000..9999)}" }
    city            { Faker::Address.city }
    prefecture_id   { (2..48).to_a.sample }
    address         { Faker::Address.street_address }
    building        { Faker::Address.secondary_address }
    phone_number { '00011112222' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
