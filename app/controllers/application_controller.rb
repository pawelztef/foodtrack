class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_premitted_parameters, if: :devise_controller?
  layout :layout_by_resource

  def after_sign_in_path_for(resource)
      backend_dashboards_path
  end

  protected
  def configure_premitted_parameters
    if resource_name == :user
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, 
                                                         :last_name, 
                                                         :email, 
                                                         :password, 
                                                         :remeber_me])

      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, 
                                                                :last_name])
    elsif resource_name == :admin
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, 
                                                         :last_name, 
                                                         :email, 
                                                         :password, 
                                                         :remeber_me, 
                                                         :address_line1,
                                                         :address_line2,
                                                         :phone,
                                                         :code,
                                                         :town])

      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name,
                                                                :last_name,
                                                                :last_name, 
                                                                :email, 
                                                                :password, 
                                                                :remeber_me, 
                                                                :address_line1,
                                                                :address_line2,
                                                                :phone,
                                                                :code,
                                                                :town])
      devise_parameter_sanitizer.permit(:accept_invitation, keys: [:first_name,
                                                                   :last_name,
                                                                   :last_name, 
                                                                   :email, 
                                                                   :password, 
                                                                   :remeber_me, 
                                                                   :address_line1,
                                                                   :address_line2,
                                                                   :phone,
                                                                   :code,
                                                                   :town])
    end
  end

  private

  def layout_by_resource
    if devise_controller? && resource_name == :admin
      "backend_login_layout"
    else
      "frontend_layout"
    end
  end

  def after_invite_path_for(resource)
    backend_admins_path
  end
end
