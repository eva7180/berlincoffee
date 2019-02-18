FactoryBot.define do
  factory :cart do

    factory :cart_with_order_items do
      transient do
        order_items_count { 2 }
      end

      after(:create) do | cart, evaluator |
        create_list(:order_item, evaluator.order_items_count, cart: cart)
      end
    end
  end
end