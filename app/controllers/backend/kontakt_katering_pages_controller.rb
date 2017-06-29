class Backend::KontaktKateringPagesController < ApplicationController
  before_action :authenticate_admin!
  include Reuseable
  before_action :set_page
  layout 'backend_layout'

  def edit
    @title = "Edycja strony 'Kontakt Katering'"
  end

  def update
    if @kontakt_katering_page.update_attributes(page_params)
      redirect_to edit_backend_kontakt_katering_page_path(params[:id]), notice: "Aktualizacja strony zakończyła się sukcessem."
    else 
      redirect_to edit_backend_kontakt_katering_page_path(params[:id]), warning: "Wystąpił problem podczas aktualizacji."
    end
  end

  private
  def set_page
    @kontakt_katering_page = safe_find("KontaktKateringPage")
    @kontakt_katering_page.pageAdds.blank? ? @kontakt_katering_page.pageAdds << PageAdd.new : @kontakt_katering_page.pageAdds 
  end

  def page_params
    params.require(:kontakt_katering_page).permit(pageAdds_attributes: PageAdd.attribute_names.map(&:to_sym).push(:_destroy))
  end

end
