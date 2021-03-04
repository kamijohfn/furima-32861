FactoryBot.define do
  factory :user do
    nickname               {Faker::Name.name}
    email                  {Faker::Internet.free_email}
    password               {Faker::Internet.password(min_length: 7)}
    password_confirmation  {password}
    last_name              {Gimei.name.last.kanji}
    first_name             {Gimei.name.first.kanji}
    last_name_kana         {Gimei.name.last.katakana}
    first_name_kana        {Gimei.name.first.katakana}
    birthday               {Faker::Date.birthday}

  end
end