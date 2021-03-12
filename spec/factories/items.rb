FactoryBot.define do
  factory :item do
    name               {Faker::Commerce.product_name}
    description        {Faker::Lorem.sentence}
    category_id        {Faker::Number.within(range: 2..11)}
    status_id          {Faker::Number.within(range: 2..7)}
    delivery_fee_id    {Faker::Number.within(range: 2..3)}
    area_id            {Faker::Number.within(range: 2..48)}
    day_id             {Faker::Number.within(range: 2..4)}
    price              {Faker::Number.number(digits: 4)}
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'),filename: 'test_image.png')
    end

  end
end
