class Backend::PolicyPagesController < ApplicationController
  before_action :authenticate_admin!
  include Reuseable
  before_action :set_page
  layout 'backend_layout'

  def edit
    @title = "Edycja strony 'Polityka prywatności'"
  end

  def update
    if @policy_page.update_attributes(page_params)
      redirect_to edit_backend_policy_page_path(params[:id]), notice: "Aktualizacja strony zakończyła się sukcessem."
    else 
      redirect_to edit_backend_policy_page_path(params[:id]), warning: "Wystąpił problem podczas aktualizacji."
    end
  end

  private
  def set_page
    @policy_page = safe_find("PolicyPage")
    @policy_page.pageAdds.blank? ? @policy_page.pageAdds << PageAdd.new : @policy_page.pageAdds 
  end

  def page_params
    params.require(:policy_page).permit(pageAdds_attributes: PageAdd.attribute_names.map(&:to_sym).push(:_destroy))
  end
end
