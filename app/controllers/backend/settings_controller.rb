class Backend::SettingsController < ApplicationController
  layout 'backend_layout'
  before_action :authenticate_admin!
  before_action :read_config
  
  def index
    @title = 'Ustawienia applikacji'
  end

  private
  def read_config
    config = YAML.load_file(Rails.root.join('config/settings.yml'))
    config["config"]["insta_client_id"] = 'pawel'
    File.open(Rails.root.join('config/settings.yml'), 'w') { |f| f.write config.to_yaml }
  end

end
