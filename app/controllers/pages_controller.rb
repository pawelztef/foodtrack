class PagesController < ApplicationController
  include Reuseable

  def home
    @stop = Stop.find_by(active: true)
    @title = "Home"
    @home_page = safe_find("HomePage")
    @carousel_products = Product.where(expose: true)
  end


  def galeria
    @title = "Galeria"
    @galeria_page = safe_find("GaleriaPage")
  end

  def produkty
    @title = "Produkty"
    @produkt_page = safe_find("ProduktPage")
    @products = Product.where(publish: true)
  end

  def produkt_show
    @product = Product.find_by_slug(params[:id])
    respond_to do |f|
      f.js
      f.html
    end
  end

  def historia
    @title = "Historia"
    @historia_page = safe_find("HistoriaPage")
  end


end
