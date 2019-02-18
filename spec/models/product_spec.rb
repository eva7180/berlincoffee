require 'rails_helper'

describe Product do
  let(:product) {FactoryBot.create(:product)}
  let(:anotherproduct) {FactoryBot.create(:product)}
  let(:lowest) {FactoryBot.create(:comment, product: product, rating: 1)}
  let(:middle) {FactoryBot.create(:comment, product: product, rating: 3)}
  let(:highest) {FactoryBot.create(:comment, product: product, rating: 5)}

  it "returns all products with name including search term" do
    expect(Product.search("Test")).to eq [product, anotherproduct]
    expect(Product.search("Foo")).to eq []
  end

  it "is only valid with a name" do
    expect(Product.new(description: "Gives a real buzz")).not_to be_valid
    expect(Product.new(name: "Valid Name")).to be_valid
    expect(product).to be_valid
  end

  context "when the product has comments" do
    before do
      lowest
      middle
      highest
    end

    it "returns the comment with highest rating" do
      expect(product.highest_rating_comment).to eq highest
    end

    it "returns the comment with lowest rating" do
      expect(product.lowest_rating_comment).to eq lowest
    end

    it "returns the average rating of all comments" do
      expect(product.average_rating).to eq 3
    end

  end
  
end