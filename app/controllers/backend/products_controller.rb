class Backend::ProductsController < ApplicationController
  before_action :set_backend_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!
  layout 'backend_layout'

  def index
    @backend_products = Product.all
    @title = 'Lista produktów'
  end

  def show
  end

  def new
    @backend_product = Product.new
    @title = 'Nowy produkt'
  end

  def edit
    @title = 'Edycja produktu'
  end

  def create
    @backend_product = Product.new(backend_product_params)

    respond_to do |format|
      if @backend_product.save
        format.html { redirect_to backend_products_path, notice: 'Product was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @backend_product.update(backend_product_params)
        format.html { redirect_to backend_products_path, notice: 'Product was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @backend_product.destroy
    respond_to do |format|
      format.html { redirect_to backend_products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_backend_product
      @backend_product = Product.find_by_slug(params[:id])
    end

    def backend_product_params
      params.require(:product).permit(:name, :slug, :price, :image, :publish, :description, :catchphrase, :expose)
    end
end
