class PagesController < ApplicationController
  include Reuseable

  def home
    @stop = Stop.find_by(active: true)
    @title = "Home"
    @home_page = safe_find("HomePage")
  end


  def galeria
    @title = "Galeria"
    @galeria_page = safe_find("GaleriaPage")
  end

  def produkty
    @title = "Produkty"
    @produkt_page = safe_find("ProduktPage")
  end

  def historia
    @title = "Historia"
    @historia_page = safe_find("HistoriaPage")
  end


end
