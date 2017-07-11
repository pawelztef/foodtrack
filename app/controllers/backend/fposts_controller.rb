class Backend::FpostsController < ApplicationController
  before_action :set_backend_fpost, only: [:show, :edit, :update, :destroy]
  layout 'backend_layout'

  # GET /backend/fposts
  # GET /backend/fposts.json
  def index
    @backend_fposts = Fpost.all.order(created_at: 'DESC')
    @title = 'Linia czasu Facebooka'
  end

  # GET /backend/fposts/1
  # GET /backend/fposts/1.json
  def show
  end

  # GET /backend/fposts/new
  def new
    @backend_fpost = Fpost.new
    @title = 'Nowy post'
  end

  # GET /backend/fposts/1/edit
  def edit
    @title = 'Edycja postu'
  end

  # POST /backend/fposts
  # POST /backend/fposts.json
  def create
    @backend_fpost = Fpost.new(backend_fpost_params)

    respond_to do |format|
      if @backend_fpost.save
        format.html { redirect_to backend_fposts_url, notice: 'Fpost was successfully created.' }
        format.json { render :show, status: :created, location: @backend_fpost }
      else
        format.html { render :new }
        format.json { render json: @backend_fpost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /backend/fposts/1
  # PATCH/PUT /backend/fposts/1.json
  def update
    @title = 'Edycja postu'
    respond_to do |format|
      if @backend_fpost.update(backend_fpost_params)
        format.html { redirect_to backend_fposts_url, notice: 'Fpost was successfully updated.' }
        format.json { render :show, status: :ok, location: @backend_fpost }
      else
        format.html { render :edit }
        format.json { render json: @backend_fpost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backend/fposts/1
  # DELETE /backend/fposts/1.json
  def destroy
    @backend_fpost.destroy
    respond_to do |format|
      format.html { redirect_to backend_fposts_url, notice: 'Fpost was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_backend_fpost
      @backend_fpost = Fpost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def backend_fpost_params
      params.require(:fpost).permit(:body)
    end
end
