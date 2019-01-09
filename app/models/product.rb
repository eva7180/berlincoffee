class Product < ApplicationRecord
  has_many :orders
  has_many :comments, dependent: :destroy

# helper method to display prices with 2 decimals
  def display_price
    if self.price
      '%.2f' % self.price
    end
  end

  def self.search(search_term)
    Product.where("name ilike ?", "%#{search_term}%")
  end

  def highest_rating_comment
    comments.rating_desc.first
  end

  def lowest_rating_comment
    comments.rating_desc.last
  end

  def average_rating
    comments.average(:rating).to_f
  end

end
