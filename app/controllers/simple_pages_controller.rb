class SimplePagesController < ApplicationController
  def index
  	@featured_product = Product.last
  end

  def about
  end

  def contact
  end

  def landing_page
  	@featured_product = Product.last
  end
end
