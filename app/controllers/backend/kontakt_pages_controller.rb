class Backend::KontaktPagesController < ApplicationController
  include Reuseable
  layout 'backend_layout'

  def edit
    @home_page = safe_find("KontaktPage")
    @title = "Edycja strony 'Kontakt'"
  end

  def update
  end

  private
end
