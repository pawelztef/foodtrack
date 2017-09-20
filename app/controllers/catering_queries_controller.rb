class CateringQueriesController < ApplicationController
  include Reuseable

  def new
    @query = Query.new
    @kontakt_katering_page_addon = safe_find('KontaktKateringPage')
  end

  def create
    @query = Query.new(query_params)
    @query.catering_flag = true
    @kontakt_katering_page_addon = safe_find('KontaktKateringPage')
    if @query.save
      ClientQueriesMailer.client_query(@query).deliver
      redirect_to catering_queries_new_url, notice: 'Zapytanie zostało wysłane.'
    else
      render :new
    end
  end

  private
  def query_params
    params.require(:query).permit(:fullname, :email, :phone, :body, :from_date, :to_date, :catering_flag, :town)
  end
end
