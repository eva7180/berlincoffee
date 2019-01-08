class OrdersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @orders = Order.includes(:product).all
  end

  def create
  end

  def show
    @order = Order.find(params[:id])
  end

  def destroy
  end

end 