require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:product) {FactoryBot.create(:product)}
  let(:user) {FactoryBot.create(:user)}

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

  it "is not valid with rating not being an integer" do
    expect(Comment.new(product: product, body: "a comment", user: user, rating: "top")).not_to be_valid
  end

  it "is valid when body, user, product and rating (integer) present" do
    expect(Comment.new(body: "a comment", user: user, product: product, rating: 5)).to be_valid
  end
end
