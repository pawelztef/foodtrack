class Backend::ProduktPagesController < ApplicationController
  include Reuseable
  layout 'backend_layout'

  def edit
    @home_page = safe_find("ProduktPage")
    @title = "Edycja strony 'Produkty'"
  end

  def update
  end

  private
end
