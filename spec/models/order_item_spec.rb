require 'rails_helper'

describe OrderItem do
  let(:product) {FactoryBot.create(:product)}
  let(:cart) {FactoryBot.create(:cart)}
  let (:valid_item) {FactoryBot.create(:order_item)} #quantity defaults to 1

  it "is not valid without quantity" do
    expect(OrderItem.new(product: product, cart: cart, quantity: nil)).not_to be_valid
  end

  it "is not valid with quantity <0 or >999" do
    expect(OrderItem.new(product: product, cart: cart, quantity: -5)).not_to be_valid
    expect(OrderItem.new(product: product, cart: cart, quantity: 2000)).not_to be_valid
  end

  it "is valid with quantity between 1 and 999" do
    expect(valid_item).to be_valid
    expect(OrderItem.new(product: product, cart: cart, quantity: 50)).to be_valid
  end
end

