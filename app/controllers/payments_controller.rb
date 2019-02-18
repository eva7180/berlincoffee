class PaymentsController < ApplicationController

	def create
		@cart = Cart.find(params[:cart_id])
		@user = current_user
		@stripe_email = params[:stripeEmail]

	  token = params[:stripeToken]
	  # Create the charge on Stripe's servers - this will charge the user's card
	  begin
	    charge = Stripe::Charge.create(
	      amount: (@cart.total_price * 100).round, # amount in cents, again
	      currency: "eur",
	      source: token,
	      description: "Coffee",
	      receipt_email: params[:stripeEmail]
	    )

	    # on checkout 
	    # 1. create Order 
	    # 2. feed order_items from cart into order / set item.cart_id to nil so item won't be deleted when cart gets destroyed
	    # 3. save order
	    # 4. destroy the cart
	    if charge.paid
	    	@order = Order.new(user_id: @user.id, status: "paid")
	    	@cart.order_items.each do |item|
	    		@order.order_items << item
	    		item.cart_id = nil
	    	end
	    	@order.save
	    	@cart.destroy
	    	session[:cart_id] = nil

	    	UserMailer.order_confirmation(@user, @stripe_email, @cart).deliver_now
	    end

	  rescue Stripe::CardError => e
	    # The card has been declined
	    body = e.json_body
    	err = body[:error]
    	flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
  	end
	end

end
