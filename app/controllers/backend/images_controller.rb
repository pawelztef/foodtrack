class Backend::ImagesController < ApplicationController
  layout 'backend_layout'

  before_action :set_image, only: [:destroy ]

  def index
    @images = Image.all
    @title = "Galeria zdjęć"
    respond_to do |format|
      format.js
      format.html
    end
  end

  def new
    @image = Image.new
    respond_to do |format|
      format.js
      format.html
    end
  end

  def create
    # @image = Image.create(image_params)
    @image = Image.new(image_params)
    filename = image_params[:image].original_filename
    @image.image_title = filename if @image.image_title.blank?
    @image.save
    # respond_to do |format|
      # if @image.save
      #   format.js {redirect_to backend_images_url, notice: 'Zdjęcie zostało zapisane.'}
      #   format.html {redirect_to backend_images_url, notice: 'Zdjęcie zostało zapisane.'}
      # else 
      #   format.js { render :action => 'new' }
      # end
    # end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to backend_images_url, notice: 'Zdjęcie zostało usunięte.'
  end

  private 

  def image_params
    params.require(:image).permit(:id, :image, :image_title)
  end

  def set_image
    @image = Image.find(params[:id])
  end


end
