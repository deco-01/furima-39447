FactoryBot.define do
  FactoryBot.define do
    factory :item do
      name                  { 'hoge' }
      description           { Faker::Lorem.sentence }
      condition_id          { 2 }
      delivery_charge_id    { 2 }
      category_id           { 2 }
      handing_time_id       { 2 }
      price                 { 9999 }
      prefecture_id         { 2 }
      association :user
      after(:build) do |item|
        item.image.attach(io: File.open('public/images/hero.jpg'), filename: 'hero.jpg')
      end
    end
  end
end
