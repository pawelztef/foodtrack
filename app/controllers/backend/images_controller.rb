class Backend::ImagesController < ApplicationController
  layout 'backend_layout'

  before_action :set_image, only: [:destroy ]

  def index
    @images = Image.all
    @title = "Galeria zdjęć"
  end

  def new
    @image = Image.new
    respond_to do |format|
      format.js
      format.html
    end
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      redirect_to backend_images_path, notice: 'Zdjęcie zostało zapisane.'
    else 
      render 'new'
    end
  end

  def destroy
  end

  private 

  def image_params
    params.requrie(:image).permit(:image, :image_title)
  end

  def set_image
    @image = Image.find(params[:id])
  end


end
