class Backend::HistoriaPagesController < ApplicationController
  include Reuseable
  before_action :set_page
  layout 'backend_layout'

  def edit
    @historia_page = safe_find("HistoriaPage")
    @title = "Edycja strony 'Historia'"
  end

  def update
    if @historia_page.update_attributes(page_params)
      redirect_to edit_backend_historia_page_path(params[:id]), notice: "Aktualizacja strony zakończyła się sukcessem."
    else 
      redirect_to edit_backend_historia_page_path(params[:id]), warning: "Wystąpił problem podczas aktualizacji."
    end
  end

  private
  def set_page
    @historia_page = safe_find("HistoriaPage")
    @historia_page.pageAdds.blank? ? @historia_page.pageAdds << PageAdd.new : @historia_page.pageAdds
    byebug
  end

  def page_params
    params.require(:historia_page).permit(pageAdds_attributes: PageAdd.attribute_names.map(&:to_sym).push(:_destroy))
  end
end
