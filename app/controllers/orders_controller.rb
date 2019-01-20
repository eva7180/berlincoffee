class OrdersController < ApplicationController
	before_action :authenticate_user!
	load_and_authorize_resource #restricts who can manage orders (abilities defined in ability.rb)

	def show
		@order = Order.find(params[:id])
	end

end