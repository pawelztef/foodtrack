class QueriesController < ApplicationController
  include Reuseable

  def new
    @query = Query.new
    @kontakt_page_addon = safe_find('KontaktPage')
    @settings = Setting.first
  end

  def create
    @query = Query.new(query_params)
    @query.catering_flag = false
    @settings = Setting.first
    if @query.save
      ClientQueriesMailer.client_query(@query).deliver
      redirect_to queries_new_url, notice: 'Query was successfully created.'
    else
      render :new
    end
  end

  private
  def query_params
    params.require(:query).permit(:fullname, :town, :email, :phone, :body)
  end
end
