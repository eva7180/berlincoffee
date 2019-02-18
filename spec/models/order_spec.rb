require 'rails_helper'

RSpec.describe Order do
  let(:user) {FactoryBot.create(:user)}
  let(:order) {FactoryBot.create(:order, user: user)}
  let(:product1) {FactoryBot.create(:product, price: 5)}
  let(:product2) {FactoryBot.create(:product, price: 1)}
  let(:item1) {order.order_items.create(product: product1, quantity: 10 )}
  let(:item2) {order.order_items.create(product: product2, quantity: 5 )}
  #let(:item1) {FactoryBot.create(:order_item, order: order, product: product1, quantity: 10 )}
  #let(:item2) {FactoryBot.create(:order_item, order: order, product: product2, quantity: 5 )}

  before do
    item1
    item2
  end

  it "calculates the total price of an order" do
    expect(order.calculate_total).to eq 55
  end

  it "counts the total number of items in an order" do
    expect(order.total_item_count). to eq 15
  end
end
