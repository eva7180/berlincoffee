class OrderItemsController < ApplicationController

  def create
    @cart = current_cart
    @item = @cart.order_items.new(item_params)
    @cart.save
    session[:cart_id] = @cart.id
    redirect_to cart_path
  end

  def update
    @cart = current_cart
    @item = @cart.order_items.find(params[:id])
    @item.update(item_params)
    @cart.save
    redirect_to cart_path
  end

  def destroy
    @cart = current_cart
    @item = @cart.order_items.find(params[:id])
    @item.destroy
    @cart.save
    redirect_to cart_path
  end

  private

  def item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end

end
