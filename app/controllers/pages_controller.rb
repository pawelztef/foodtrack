class PagesController < ApplicationController
  require "instagram"
  include Reuseable
  before_action :instagram_init

  def home
    @stop = Stop.find_by(active: true)
    @title = "Home"
    @home_page = safe_find("HomePage")
    @carousel_products = Product.where(expose: true)
    number_of_posts = Setting.first.posts_on_wall
    @posts = Post.where(publish: true).order(publish_date: :desc).first(number_of_posts)
  end


  def galeria
    number_of_posts = safe_find('Setting').posts_on_gallery
    @title = "Galeria"
    @galeria_page = safe_find("GaleriaPage")
    begin
      @popular = Instagram.user_recent_media(count: number_of_posts)
    rescue => e
      redirect_to root_path 
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
    Instagram.configure do |config|
      config.client_id = Settings.instagram_id
      config.client_secret = Settings.instagram_secret
      config.access_token = Settings.instagram_token
    end
  end


end
