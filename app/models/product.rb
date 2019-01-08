class Product < ApplicationRecord
  has_many :orders

# helper method to display prices with 2 decimals
  def display_price
    if self.price
      '%.2f' % self.price
    end
  end

  def self.search(search_term)
    Product.where("name ilike ?", "%#{search_term}%")
  end

end
