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
  def destroy
    @query = Query.find(params[:id])
    @query.destroy
    redirect_to backend_mailbox_index_path, notice: 'Post was successfully destroyed.'
  end

end
