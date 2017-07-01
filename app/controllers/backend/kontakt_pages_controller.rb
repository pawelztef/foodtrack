class Backend::KontaktPagesController < ApplicationController
  before_action :authenticate_admin!
  include Reuseable
  before_action :set_page
  layout 'backend_layout'

  def edit
    @title = "Edycja strony 'Kontakt'"
  end

  def update
    if @kontakt_page.update_attributes(page_params)
      redirect_to edit_backend_kontakt_page_path(params[:id]), notice: "Aktualizacja strony zakończyła się sukcessem."
    else 
      redirect_to edit_backend_kontakt_page_path(params[:id]), warning: "Wystąpił problem podczas aktualizacji."
    end
  end

  private
  def set_page
    @kontakt_page = safe_find("KontaktPage")
    @kontakt_page.pageAdds.blank? ? @kontakt_page.pageAdds << PageAdd.new : @kontakt_page.pageAdds 
  end

  def page_params
    params.require(:kontakt_page).permit(pageAdds_attributes: PageAdd.attribute_names.map(&:to_sym).push(:_destroy))
  end

end
