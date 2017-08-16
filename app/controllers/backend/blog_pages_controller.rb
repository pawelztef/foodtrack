class Backend::BlogPagesController < ApplicationController
  before_action :authenticate_admin!
  include Reuseable
  before_action :set_page
  layout 'backend_layout'

  def edit
    @title = "Edycja strony 'Aktualności'"
  end

  def update
    if @blog_page.update_attributes(page_params)
      redirect_to edit_backend_blog_page_path(params[:id]), notice: "Aktualizacja strony zakończyła się sukcessem."
    else 
      redirect_to edit_backend_blog_page_path(params[:id]), warning: "Wystąpił problem podczas aktualizacji."
    end
  end

  private
  def set_page
    @blog_page = safe_find("BlogPage")
    @blog_page.pageAdds.blank? ? @blog_page.pageAdds << PageAdd.new : @blog_page.pageAdds 
  end

  def page_params
    params.require(:blog_page).permit(pageAdds_attributes: PageAdd.attribute_names.map(&:to_sym).push(:_destroy))
  end

end
