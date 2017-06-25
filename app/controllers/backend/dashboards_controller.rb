class Backend::DashboardsController < ApplicationController
  before_action :authenticate_admin!
  layout 'backend_layout'

  def index
    @welcome_msg = "Welcome to backend"
    @title = 'Panel administracyjny'
    @track = Track.find_by(active: true)
  end
end
