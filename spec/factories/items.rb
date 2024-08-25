FactoryBot.define do
  factory :item do
    name                        { Faker::Commerce.product_name }
    explanation                 { Faker::Lorem.sentence }
    price                       { Faker::Number.between(from: 300, to: 9_999_999) }
    category_id                 { (2..11).to_a.sample }
    item_situation_id           { (2..7).to_a.sample }
    load_id                        { (2..2).to_a.sample }
    prefecture_id                  { (2..48).to_a.sample }
    shipping_location_id           { (2..4).to_a.sample }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/design_copy.jpg'), filename: 'design_copy.jpg')
    end
  end
end
