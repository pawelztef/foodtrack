class Backend::MailboxController < ApplicationController
  layout 'backend_layout'
  def index
    @queries = Query.all
    @title = 'Zapytania'
  end
  def show
    @query = Query.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end
end
