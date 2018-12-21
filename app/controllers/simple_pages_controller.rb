class SimplePagesController < ApplicationController
  def index
  	@featured_products = Product.order(:updated_at).last(3)
  end

  def about
  end

  def contact
  end

end
