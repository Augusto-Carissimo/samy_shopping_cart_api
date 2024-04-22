FactoryBot.define do
  factory :cart_item do
    item
    cart
    quantity { 1 }
  end
end
