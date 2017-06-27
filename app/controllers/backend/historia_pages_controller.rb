class Backend::HistoriaPagesController < ApplicationController
  include Reuseable
  layout 'backend_layout'

  def edit
    @home_page = safe_find("HistoriaPage")
    @title = "Edycja strony 'Historia'"
  end

  def update
  end

  private
end
