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
      redirect_to backend_dashboards_path, alert: 'Niepoprawne hasło - brak dostępu.' 
    end
  end

  def new
  end

  def create 
  end

  def update
    if @settings.update(settings_params)
      render :index, notice: 'Ustawienia zostały zapisane.'
    else
      redirect_to backend_settings_path, alert: 'Wystąpił problem, ustawienia nie zoatały zapisane.'
    end
  end

  private
  def settings_params 
    params.require(:setting).permit(:posts_on_wall, 
                                    :posts_on_gallery,
                                    :smtp_username,
                                    :password,
                                    :smtp_pass,
                                    :facebook_app_id,
                                    :facebook_secret,
                                    :image,
                                    :twitter_address,
                                    :address_line1,
                                    :address_line2,
                                    :email,
                                    :phone,
                                    social_icons_attributes: SocialIcon.attribute_names.map(&:to_sym).push(:_destroy)) 
  end

  def set_settings
    @settings = safe_find('Setting')
    @title = 'Ustawienia aplikacji'
    social_icons_instances
  end

  def social_icons_instances
    if @settings.social_icons.empty?
      4.times do
        @settings.social_icons << SocialIcon.new
      end
    end 
    @social_icons = @settings.social_icons.limit(4)
  end

end
