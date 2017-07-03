class Backend::SettingsController < ApplicationController
  include Reuseable
  layout 'backend_layout'
  before_action :authenticate_admin!
  before_action :set_settings

  def index
    @title = 'Ustawienia aplikacji'
  end

  def new
  end

  def create 
  end

  def update
    if @settings.update(settings_params)
      redirect_to backend_settings_path, notice: 'Ustawienia zostały zapisane.'
    else
      redirect_to backend_settings_path, warning: 'Wystąpił problem, ustawienia nie zoatały zapisane.'
    end
  end

  private
  def settings_params 
    params.require(:setting).permit(:posts_on_wall, 
                                     :posts_on_gallery,
                                     :smtp_username,
                                     :smtp_password,
                                     :intagram_id,
                                     :instagram_secret,
                                     :instagram_token)
  end

  def set_settings
    @settings = safe_find('Setting')
  end

end
