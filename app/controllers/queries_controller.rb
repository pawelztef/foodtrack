class QueriesController < ApplicationController

  def new
    @query = Query.new
  end

  def create
    @query = Query.new(query_params)
    @query.catering_flag = false
    if @query.save
      ClientQueriesMailer.client_query(@query).deliver
      redirect_to queries_new_url, notice: 'Query was successfully created.'
    else
      render :new
    end
  end

  private
  def query_params
    params.require(:query).permit(:fullname, :email, :phone, :body)
  end
end