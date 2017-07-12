class FacebooksessionsController < ApplicationController
  before_action :authenticate_admin!
  
  def new
    session[:auth_token] = env['omniauth.auth']['credentials']['token']
    redirect_to  backend_fposts_url
  end
  
  def destroy
    session[:facebook_credentials] = nil
    redirect_to backend_dashboards_url
  end
end
