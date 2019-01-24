class OrderItemsController < ApplicationController
  before_action :set_cart
  before_action :set_item, only: [:update, :destroy]

  def create
    selected_product = Product.find(item_params[:product_id])

    if @cart.products.include?(selected_product)
      @item = @cart.order_items.find_by(product_id: selected_product)
      @item.quantity += item_params[:quantity].to_i
    else
      @item = @cart.order_items.new(item_params)
    end
    @item.save
    session[:cart_id] = @cart.id
    if user_signed_in? && (@cart.user_id == nil) #assign cart to current_user so it will be stored for the user
      @cart.user_id = current_user.id
      @cart.save
    end
    redirect_to cart_path
  end

  def update
    @item.update(item_params)
    @item.save
    redirect_to cart_path
  end

  def destroy
    @item.destroy
    @cart.save
    redirect_to cart_path
  end

  private

  def item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end

  def set_cart
    @cart = current_cart
  end

  def set_item
    @item = @cart.order_items.find(params[:id])
  end

end
