class SimplePagesController < ApplicationController
  def index
    @featured_products = Product.joins(:comments).group('products.id').last(3) #fix this to show the 3 products with highest rating comments only
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
