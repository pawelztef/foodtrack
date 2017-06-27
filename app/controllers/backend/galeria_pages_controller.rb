class Backend::GaleriaPagesController < ApplicationController
  include Reuseable
  layout 'backend_layout'

  def edit
    @home_page = safe_find("GaleriaPage")
    @title = "Edycja strony 'Galeria'"
  end

  def update
  end

  private
end
