class Backend::StopsController < ApplicationController
  def activate
    @stop = Stop.find(params[:stop_id])
    @stop.active = true
    if @stop.save
      redirect_to backend_dashboards_url
    else
      redirect_to backend_dashboards_url, notice: "Wystąstąpił problem, dane nie zostały zapiane"
    end
  end
end
