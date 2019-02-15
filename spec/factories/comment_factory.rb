FactoryBot.define do
  factory :comment do
    product
    user
    body { "Test comment"}
  end
end