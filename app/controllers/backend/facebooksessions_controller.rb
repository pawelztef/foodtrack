class Backend::FacebooksessionsController < ApplicationController
  before_action :authenticate_admin!
  
  def create
    session[:auth_token] = env['omniauth.auth']['token']
    byebug
    redirect_to backend_fposts_url
  end
  
  def destroy
    redirect_to backend_dashboards_url
  end
end
