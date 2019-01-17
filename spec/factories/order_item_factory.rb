FactoryBot.define do
	factory :order_item do
		product
		cart
		quantity { 10 }
	end
end