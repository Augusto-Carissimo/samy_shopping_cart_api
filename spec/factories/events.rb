# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    name { Faker::ChuckNorris.fact }
    price { 1 }
    stock { 10 }
  end
end
