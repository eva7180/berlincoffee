class SimplePagesController < ApplicationController
  def index
  	@featured_products = Product.order(:updated_at).last(3)
  end

  def about
  end

  def contact
  end

  def landing_page
  	@featured_product = Product.last
  end
end
