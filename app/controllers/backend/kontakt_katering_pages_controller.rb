class Backend::KontaktKateringPagesController < ApplicationController
  include Reuseable
  layout 'backend_layout'

  def edit
    @home_page = safe_find("KontaktKateringPage")
    @title = "Edycja strony 'Kontakt Katering'"
  end

  def update
  end

  private
end
