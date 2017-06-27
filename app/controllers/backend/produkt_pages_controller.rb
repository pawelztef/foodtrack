class Backend::ProduktPagesController < ApplicationController
  include Reuseable
  before_action :set_page
  layout 'backend_layout'

  def edit
    @title = "Edycja strony 'Produkty'"
  end

  def update
    if @produkt_page.update_attributes(page_params)
      redirect_to edit_backend_produkt_page_path(params[:id]), notice: "Aktualizacja strony zakończyła się sukcessem."
    else 
      redirect_to edit_backend_produkt_page_path(params[:id]), warning: "Wystąpił problem podczas aktualizacji."
    end
  end

  private
  def set_page
    @produkt_page = safe_find("ProduktPage")
    @produkt_page.pageAdds.blank? ? @produkt_page.pageAdds << PageAdd.new : @produkt_page.pageAdds 
  end

  def page_params
    params.require(:produkt_page).permit(pageAdds_attributes: PageAdd.attribute_names.map(&:to_sym).push(:_destroy))
  end
  
end
