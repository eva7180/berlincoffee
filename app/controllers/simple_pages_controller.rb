class SimplePagesController < ApplicationController
  def index
    @featured_products = Product.order(:updated_at).last(3)
    @number_of_featured_products = @featured_products.length
  end

  def about
  end

  def contact
  end

  def thank_you
  	@name = params[:name]
  	@email = params[:email]
  	@message = params[:message]

  	UserMailer.contact_form(@email, @name, @message).deliver_now
  end

end
