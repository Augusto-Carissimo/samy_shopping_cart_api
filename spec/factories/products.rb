FactoryBot.define do
  factory :product do
    name { Faker::ChuckNorris.fact }
    price { 1 }
    stock { 10 }
  end
end
