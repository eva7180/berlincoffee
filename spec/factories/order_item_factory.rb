FactoryBot.define do
  factory :order_item do
    product
    cart
    order
  end
end