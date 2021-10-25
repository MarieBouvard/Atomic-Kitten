class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    include ApplicationHelper
    after_action :create_cart_and_assign_to_current_user, only: [:create]

    protected
   
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password, :password_confirmation])
       devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :email, :avatar])
    end
end


  