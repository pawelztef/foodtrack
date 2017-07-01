class Backend::RepliesController < ApplicationController
  before_action :authenticate_admin!
end
