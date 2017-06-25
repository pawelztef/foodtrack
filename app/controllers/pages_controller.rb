class PagesController < ApplicationController

  def home
    @stop = Stop.find_by(active: true)
    @title = "Home"
  end

  def katering 
    @query = Query.new
    @title = "Katering"
  end

  def kontakt
    @query = Query.new
    @title = "Kontakt"
  end

  def galeria
    @title = "Galeria"
  end

  def produkty
    @title = "Produkty"
  end

  def historia
    @title = "Historia"
  end

end
