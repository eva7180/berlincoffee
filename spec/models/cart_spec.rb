require 'rails_helper'

describe Cart do
	context "when cart has items" do
		let(:cart) { FactoryBot.create(:cart) }
		let(:product1) {FactoryBot.create(:product, price: 5)}
		let(:product2) {FactoryBot.create(:product, price: 1)}
		before do
			cart.order_items.new(product: product1, cart: cart, quantity: 10)
			cart.order_items.new(product: product2, cart: cart, quantity: 5)
		end

		it "returns the total price of all items in cart" do
			expect(cart.calculate_total).to eq 55
		end
	end
	
# describe Cart do
# 	context "when cart has items" do
# 		let(:cart) { FactoryBot.create(:cart_with_order_items, order_items_count: 2) }
# 		let(:product1) {FactoryBot.create(:product_with_order_items, price: 5)}
# 		let(:product2) {FactoryBot.create(:product_with_order_items, price: 1)}
# 		let(:item1) {FactoryBot.create(:order_item, product: product1, cart: cart )}
# 		let(:item2) {FactoryBot.create(:order_item, product: product2, cart: cart )}

# 		it "returns the total price of all items in cart" do
# 			byebug
# 			expect(cart.calculate_total).to eq 55
# 		end
# 	end

end
