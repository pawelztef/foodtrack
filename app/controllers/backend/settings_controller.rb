class Backend::SettingsController < ApplicationController
  include Reuseable
  layout 'backend_layout'
  before_action :authenticate_admin!
  before_action :set_settings

  def authenticate
    respond_to do |format|
      format.js
    end
  end

  def index
    if !current_admin.valid_password?(params[:password])
      redirect_to backend_dashboards_path, notice: 'Niepoprawne hasło - brak dostępu.' 
    end
  end

  def new
  end

  def create 
  end

  def update
    if @settings.update(settings_params)
      render :index, notice: 'Ustawienia zostały zapisane.'
      # redirect_to backend_settings_path, notice: 'Ustawienia zostały zapisane.'
    else
      redirect_to backend_settings_path, warning: 'Wystąpił problem, ustawienia nie zoatały zapisane.'
    end
  end

  private
  def settings_params 
    params.require(:setting).permit(:posts_on_wall, 
                                    :posts_on_gallery,
                                    :smtp_username,
                                    :password,
                                    :smtp_pass,
                                    :instagram_id,
                                    :instagram_secret,
                                    :instagram_token,
                                    :maps_api_key,
                                    :facebook_app_id,
                                    :facebook_secret,
                                    :image,
                                    :twitter_address)
  end

  def set_settings
    @settings = safe_find('Setting')
    @title = 'Ustawienia aplikacji'
  end

end
