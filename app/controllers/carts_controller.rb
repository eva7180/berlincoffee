class CartsController < ApplicationController

	def show
		@order_items = current_cart.order_items
	end

	def destroy
		current_cart.destroy
		session[:cart_id] = nil
		redirect_to cart_path
	end

end
