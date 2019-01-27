class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :store_user_location!, if: :storable_location?

  helper_method :current_cart
  helper_method :number_to_euro

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, alert: exception.message
  end

  def current_cart
    if user_signed_in? && current_user.carts.any? #load existing cart if signed in user has any
      Cart.find_by(user_id: current_user)
    else #load cart from session or create new cart
      if session[:cart_id]
        Cart.find(session[:cart_id])
      else
        Cart.new
      end
    end
  end

  # helper method to display prices with 2 decimals in €
  def number_to_euro(amount)
    view_context.number_to_currency(amount, unit: "€ ", separator: ",", delimiter: ".")
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end
  

  private
  #stay on same page after sign in instead of redirecting to root_path (devise default)
    def storable_location?
      request.get? && is_navigational_format? && !devise_controller? && !request.xhr? 
    end

    def store_user_location!
      store_location_for(:user, request.fullpath)
    end

    def after_sign_in_path_for(resource_or_scope)
      stored_location_for(resource_or_scope) || super
    end

end
