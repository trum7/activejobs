class ShopController < ApplicationController

  #before_action :require_admin, only: [:admin_index]
  respond_to :js
  def refreshcart
    current_cart
    @productcart = []
    session[:cart].each do |key, array|
      e = Product.find( key.to_s )
      e.quantity = array
      @productcart << e
    end
    print session[:cart]
    @productcart.each do |q|
      puts q.name
    end
  end

  def wishlistshow
    current_wishlist
    @wlshow = []
    session[:wishlist].each do |key, array|
      @wlshow << Product.find(key.to_s)
    end
    @wlshow = @wlshow.paginate(:page => params[:page],:per_page => 6)
  end
  def deletewishlist
    id = params[:id]
    current_wishlist
    @wlshow = []
    session[:wishlist].delete( id )
    session[:wishlist].each do |key, array|
      @wlshow << Product.find( key.to_s )
    end
    @wlshow = @wlshow.paginate(:page => params[:page],:per_page => 6)
    respond_to do |format|
        format.js
    end
  end

  # def deletecart
  #   id = params[:id]
  #   current_cart
  #   @productcart = []
  #   session[:cart].delete( id )
  #   session[:cart].each do |key, array|
  #     e = Product.find( key.to_s )
  #     e.quantity = array
  #     @productcart << e
  #   end
  #   @productcart.each do |q|
  #     print q.name
  #   end
  #   respond_to do |format|
  #     format.js
  #   end
  # end

end
