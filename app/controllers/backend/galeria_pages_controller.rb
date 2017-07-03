class Backend::GaleriaPagesController < ApplicationController
  include Reuseable
  before_action :authenticate_admin!
  before_action :set_page
  layout 'backend_layout'

  def edit
    @title = "Edycja strony 'Galeria'"
  end

  def update
    if @galeria_page.update_attributes(page_params)
      redirect_to edit_backend_galeria_page_path(params[:id]), notice: "Aktualizacja strony zakończyła się sukcessem."
    else 
      redirect_to edit_backend_galeria_page_path(params[:id]), warning: "Wystąpił problem podczas aktualizacji."
    end
  end

  private

  def set_page
    @galeria_page = safe_find("GaleriaPage")
    @galeria_page.pageAdds.blank? ? @galeria_page.pageAdds << PageAdd.new : @galeria_page.pageAdds 
  end

  def page_params
    params.require(:galeria_page).permit(pageAdds_attributes: PageAdd.attribute_names.map(&:to_sym).push(:_destroy) )
  end



end
