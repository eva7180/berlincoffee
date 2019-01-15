require 'rails_helper'

describe Cart do
	context "cart has items" do
		let(:cart) {Cart.create!}
		let(:product1) {Product.create!(name: "Good Coffee", price: 5)}
		let(:product2) {Product.create!(name: "Bad Coffee", price: 1)}
		before do
			cart.order_items.create!(product: product1, cart: cart, quantity: 10)
			cart.order_items.create!(product: product2, cart: cart, quantity: 5)
		end

		it "returns the total price of all items in cart" do
			expect(cart.calculate_total).to eq 55
		end
	end
	
end
