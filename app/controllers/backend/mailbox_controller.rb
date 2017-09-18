class Backend::MailboxController < ApplicationController
  before_action :authenticate_admin!
  layout 'backend_layout'

  def index
    @queries = Query.all
    @title = 'Zapytania'
  end

  def show
    @query = Query.find(params[:id])
    @query.read = true
    @query.save
    respond_to do |format|
      format.html
      format.js
    end
  end

  def send_reply_mail
    byebug
    redirect_to backend_mailbox_index_path, notice: 'Twój email został wysłany.'
  end

  def destroy
    @query = Query.find(params[:id])
    @query.destroy
    redirect_to backend_mailbox_index_path, notice: 'Zapytanie zostało usunięte z bazy danych.'
  end

end
