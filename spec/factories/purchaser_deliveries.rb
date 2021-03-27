FactoryBot.define do
  factory :purchaser_delivery do
    postal_code { '123-4567' }
    area_id            {Faker::Number.within(range: 2..48)}
    municipality { '緑区' }
    address { '青山1-1' }
    phone_number       {Faker::Number.number(digits: 11)}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
