class Backend::MailboxController < ApplicationController
  before_action :authenticate_admin!
  layout 'backend_layout'

  def index
    @queries = Query.all
    @title = 'Zapytania'
  end

  def show
    @title = 'Odpowiedź na zapytanie'
    @query = Query.find(params[:id])
    @query.read = true
    @query.save
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new_mail
    @title = 'Nowa wiadomość'
  end

  def send_mail
    @custom_mail = CustomMail.new
    @custom_mail.recipient_mail = params[:recipient_mail]
    @custom_mail.subject = params[:subject]
    @custom_mail.body = params[:body]
    if @custom_mail.save
      CustomMailer.create_custom_mail(@custom_mail).deliver
      redirect_to backend_mailbox_index_path, notice: 'Wiadomość została wysłana.'
    else
      redirect_to backend_mailbox_index_path, notice: 'Wystąpił problem z wysłaniem wiadomości.'
    end
  end

  def send_reply_mail
    @response = Reply.new
    @response.query_id = params[:query_id]
    @response.subject = params[:subject]
    @response.body = params[:body]
    if @response.save
      ReplyMailer.reply_to_query(@response).deliver
      redirect_to backend_mailbox_index_path, notice: 'Wiadomość została wysłana.'
    else
      redirect_to backend_mailbox_index_path, notice: 'Wystąpił problem z wysłaniem wiadomości.'
    end
  end

  def destroy
    @query = Query.find(params[:id])
    @query.destroy
    redirect_to backend_mailbox_index_path, notice: 'Zapytanie zostało usunięte z bazy danych.'
  end

end
