class Backend::HomePagesController < ApplicationController
  include Reuseable
  before_action :set_page
  layout 'backend_layout'

  def edit
    @title = "Edycja strony 'Home'"
  end

  def update
    if @home_page.update_attributes(page_params)
      redirect_to edit_backend_home_page_path(params[:id]), notice: "Aktualizacja strony zakończyła się sukcessem."
    else 
      redirect_to edit_backend_home_page_path(params[:id]), warning: "Wystąpił problem podczas aktualizacji."
    end
  end

  private
  def set_page
    @home_page = safe_find("HomePage")
    @home_page.pageAdds.blank? ? @home_page.pageAdds << PageAdd.new : @home_page.pageAdds 
  end

  def page_params
    params.require(:home_page).permit(pageAdds_attributes: PageAdd.attribute_names.map(&:to_sym).push(:_destroy))
  end
end
