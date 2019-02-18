require 'rails_helper'

RSpec.describe Cart, type: :model do
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

    # it "returns the total number of items in cart" do
    #   expect(cart.items_count). to eq 2
    # end
  end
  
  # commenting this out as FactoryBot for order_items does not work properly
  # (cart.order_items returns an empty array whereas product1.order_items is working fine?!)
# describe Cart do
#   context "when cart has items" do
#     let(:cart) {FactoryBot.create(:cart)}
#     let(:product1) {FactoryBot.create(:product, price: 5)}
#     let(:product2) {FactoryBot.create(:product, price: 1)}
#     # let(:item1) {FactoryBot.create(:order_item, cart: cart, product: product1, quantity: 10 )}
#     # let(:item2) {FactoryBot.create(:order_item, product: product2, cart: cart, quantity: 5 )}

#     before do
#       item1
#       item2
#     end

#     it "returns the total price of all items in cart" do
#       expect(cart.calculate_total).to eq 55
#     end
#   end

end
