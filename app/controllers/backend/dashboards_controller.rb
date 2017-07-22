class Backend::DashboardsController < ApplicationController
  before_action :authenticate_admin!
  layout 'backend_layout'

  def index
    @welcome_msg = "Welcome to backend"
    @title = 'Panel administracyjny'
    @track = Track.find_by(active: true)
    @published_posts = Post.where(draft: false).order(publish_date: :desc).first(5)
    @visits = VisitLog.limit(5).order(log_in: :desc)
  end
end
