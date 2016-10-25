class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  #protect_from_forgery with: :exception

  #skip_before_filter :verify_authenticity_token
  #before_filter :authenticate_user!
  #protect_from_forgery with: :null_session, prepend: true
  #before_action :authenticate_user!
  #helper_method :current_user

  #protect_from_forgery with: :null_session, prepend: true
  before_action :set_locale, :current_cart
#  helper_method :current_user
  helper_method :current_cart
  helper_method :addtocart
  #skip_before_action :verify_authenticity_token


  def addtocart
    id = params[:id]
    current_cart
    session[:cart][id] = 1

    puts session[:cart]
  end
  def addtocartget
    id = params[:id]
    current_cart
    session[:cart][id] = 1

    puts session[:cart]
  end
  def addtowishlist
    id = params[:id]
    current_wishlist
    session[:wishlist][id] = 1
    puts session[:wishlist]
  end
  private
    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
    end

    def default_url_options(options={})
      {locale: I18n.locale}
    end

    #def current_user
  #    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  #  end

    def current_cart
      session[:cart]= {} if session[:cart] == nil
    end
    def current_wishlist
      session[:wishlist]= {} if session[:wishlist] == nil
    end

    def require_user
      redirect_to root_path unless current_user
    end

    def require_admin
      if current_user != nil
        redirect_to root_path unless current_user.admin?
      else
        redirect_to root_path
      end
    end

    def require_linguist
      redirect_to root_path unless current_user.linguist?
    end

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end


    protected
      def registration_params
        params.require(:user).permit(:role, :name, :email, :password, :password_confirmation)
      end


    # If you have extra params to permit, append them to the sanitizer.
     def configure_sign_up_params
       devise_parameter_sanitizer.permit(:sign_up) do |user|
         user.permit(:role, :name, :email, :password, :password_confirmation)
       end
     end

    # If you have extra params to permit, append them to the sanitizer.
     def configure_account_update_params
       devise_parameter_sanitizer.permit(:account_update) do |user|
        user.permit(:role, :name, :email, :password, :password_confirmation)
       end
     end



end
