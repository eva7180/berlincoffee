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

  	ActionMailer::Base.mail(
  		from: @email, 
  		to: 'evasmail@gmail.com',
  		subject: "A new contact form message from #{@name}",
  		body: @message).deliver_now
  end

end
