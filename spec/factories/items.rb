FactoryBot.define do
  FactoryBot.define do
    factory :item do
      name                  { 'hoge' }
      description           { Faker::Lorem.sentence }
      condition_id          { 1 }
      delivery_charge_id    { 1 }
      category_id           { 1 }
      handing_time_id       { 1 }
      price                 { '9999' }
      prefecture_id         { 1 }
    end
  end
end
