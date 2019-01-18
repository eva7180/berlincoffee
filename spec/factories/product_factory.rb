FactoryBot.define do
  factory :product do
    name { "Test Product" }

    factory :product_with_order_items do
      transient do
        order_items_count { 1 }
      end

      after(:create) do | product, evaluator |
        create_list(:order_item, evaluator.order_items_count, product: product)
      end
    end
  end
end