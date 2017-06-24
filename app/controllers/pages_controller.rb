class PagesController < ApplicationController

  def home
  end

  def katering 
    @query = Query.new
  end

  def kontakt
    @query = Query.new
  end

  def galeria
  end

  def produkty
  end

  def historia
  end

end
