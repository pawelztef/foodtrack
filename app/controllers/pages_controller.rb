class PagesController < ApplicationController
  require "instagram"
  include Reuseable

  def home
    @stop = Stop.find_by(active: true)
    @title = "Home"
    @home_page = safe_find("HomePage")
    @carousel_products = Product.where(expose: true)
    number_of_posts = safe_find('Setting').posts_on_wall
    @posts = Post.where(publish: true).order(publish_date: :desc).first(number_of_posts)
    if @truck = Track.find_by_active(true)
      @markers_hash = Gmaps4rails.build_markers(@truck.stops) do |stop, marker|
        marker.lat stop.latitude
        marker.lng stop.longitude
        marker.infowindow stop.full_street_address
        marker.title stop.full_street_address
        if stop.active 
          marker.picture({
            :url    => ActionController::Base.helpers.asset_path('icon.png'),
            :width  => "36",
            :height => "36",
          })
        end
      end
    end
  end


  def galeria
    number_of_posts = safe_find('Setting').posts_on_gallery
    @title = "Galeria"
    @galeria_page = safe_find("GaleriaPage")
    begin
      instagram_init
      @popular = Instagram.user_recent_media(count: number_of_posts)
    rescue => e
      @popular = [] 
      render :galeria 
    end
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


  private
  def instagram_init
    Settings.reload!
    Instagram.configure do |config|
      config.client_id = Settings.instagram_id
      config.client_secret = Settings.instagram_secret
      config.access_token = Settings.instagram_token
    end
  end


end
