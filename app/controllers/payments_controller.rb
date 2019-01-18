class PaymentsController < ApplicationController

	def create
		@cart = Cart.find(params[:cart_id])
		@user = current_user

	  token = params[:stripeToken]
	  # Create the charge on Stripe's servers - this will charge the user's card
	  begin
	    charge = Stripe::Charge.create(
	      amount: (@cart.total_price * 100).round, # amount in cents, again
	      currency: "eur",
	      source: token,
	      description: params[:stripeEmail]
	    )
	  rescue Stripe::CardError => e
	    # The card has been declined
	  end
	end

end
