class SimplePagesController < ApplicationController
  def index
    @products = Product.all
    @reviewed_products = []
    @products.each do |product|
      if product.comments.count > 0
        @reviewed_products << product
      end
    end
    @featured_products = @reviewed_products.last(3)
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
