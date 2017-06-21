class QueriesController < ApplicationController
  def new
    @query = Query.new
  end

  def create
    @query = Query.new(query_params)
    if @query.save
      redirect_to queries_new_path, notice: 'Query was successfully created.'
    else
      render :new
    end
  end

  private
  def query_params
    params.require(:query).permit(:fullname, :email, :phone, :body)
  end
end
