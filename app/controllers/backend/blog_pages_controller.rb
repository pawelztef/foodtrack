class Backend::BlogPagesController < ApplicationController
  include Reuseable
  layout 'backend_layout'

  def edit
    @home_page = safe_find("BlogPage")
    @title = "Edycja strony 'Blog'"
  end

  def update
  end

  private

end
