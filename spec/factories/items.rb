FactoryBot.define do
  factory :item do
    name { Faker::ChuckNorris.fact }
    price { 1 }
    stock { 10 }
  end
end
