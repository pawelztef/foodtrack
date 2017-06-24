class CateringQueriesController < ApplicationController

  def new
    @query = Query.new
  end

  def create
    @query = Query.new(query_params)
    @query.catering_flag = true
    if @query.save
      ClientQueriesMailer.client_query(@query).deliver
      redirect_to catering_queries_new_url, notice: 'Query was successfully created.'
    else
      render :new
    end
  end

  private
  def query_params
    params.require(:query).permit(:fullname, :email, :phone, :body, :from_date, :to_date, :catering_flag, :town)
  end
end
