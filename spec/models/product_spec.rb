require 'rails_helper'

describe Product do
  context "when the product has comments" do
    let(:product) {Product.create!(name: "Good Coffee")}
    let(:user) {User.create!(email: "test@test.com", password: "password")}
    before do
      product.comments.create!(rating: 1, user: user, body: "Bitter!")
      product.comments.create!(rating: 3, user: user, body: "Ok!")
      product.comments.create!(rating: 5, user: user, body: "Great!")
    end
    # let(:comment1) {product.comments.create!(rating: 1, user: user, body: "Bitter!")}
    # let(:comment2) {product.comments.create!(rating: 3, user: user, body: "Ok!")}
    # let(:comment3) {product.comments.create!(rating: 5, user: user, body: "Great!")}

    # it "returns the comment with highest rating" do
    #   expect(product.highest_rating_comment).to eq product.comments.create!(rating: 5, user: user, body: "Great!")
    # end

    # it "returns the comment with lowest rating" do
    #   expect(product.lowest_rating_comment).to eq product.comments.create!(rating: 1, user: user, body: "Bitter!")
    # end

    it "returns the average rating of all comments" do
      expect(product.average_rating).to eq 3
    end

    it "is not valid without a name" do
      expect(Product.new(description: "Gives a real buzz")).not_to be_valid
    end
  end
  
end