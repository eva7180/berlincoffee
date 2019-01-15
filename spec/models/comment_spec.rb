require 'rails_helper'

RSpec.describe Comment, type: :model do
  context "when comment exists" do
  	let(:product) {Product.create!(name: "a product")}
  	let(:user) {User.create!(email: "test@test.com", password: "password")}

  	it "is not valid without a body" do
  		expect(Comment.new(user: user, product: product, rating: 5)).not_to be_valid
  	end

  	it "is not valid without a product" do
  		expect(Comment.new(user: user, body: "a comment", rating: 5)).not_to be_valid
  	end

  	it "is not valid without a user" do
  		expect(Comment.new(product: product, body: "a comment", rating: 5)).not_to be_valid
  	end

  	it "is not valid without a rating" do
  		expect(Comment.new(product: product, body: "a comment", user: user)).not_to be_valid
  	end
  end
end
