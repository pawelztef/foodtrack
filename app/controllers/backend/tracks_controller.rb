class Backend::TracksController < ApplicationController
  before_action :set_track, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!
  layout 'backend_layout'

  # GET /backend/tracks
  # GET /backend/tracks.json
  def index
    @tracks = Track.all
    @title = "Lista tras"
  end

  # GET /backend/tracks/1
  # GET /backend/tracks/1.json
  def show
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /backend/tracks/new
  def new
    @track = Track.new
    @track.stops.build
    @title = "Nowa trasa"
  end

  # GET /backend/tracks/1/edit
  def edit
    @track.stops.build
    @title = "Edycja Trasy"
  end

  # POST /backend/tracks
  # POST /backend/tracks.json
  def create
    @track = Track.new(track_params)

    respond_to do |format|
      if @track.save
        format.html { redirect_to backend_tracks_url, notice: 'Track was successfully created.' }
        format.json { render :show, status: :created, location: @track }
      else
        format.html { render :new }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /backend/tracks/1
  # PATCH/PUT /backend/tracks/1.json
  def update
    respond_to do |format|
      if @track.update(track_params)

        format.html { redirect_to backend_tracks_url, notice: 'Track was successfully updated.' }
        format.json { render :show, status: :ok, location: @track }
      else
        format.html { render :edit }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backend/tracks/1
  # DELETE /backend/tracks/1.json
  def destroy
    @track.destroy
    respond_to do |format|
      format.html { redirect_to backend_tracks_url, notice: 'Track was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_track
    @track = Track.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def track_params
    params
    .require(:track)
    .permit(:route_name,
            :driver,
            :truck,
            :active,
            :description,
            stops_attributes: Stop.attribute_names.map(&:to_sym).push(:_destroy))
  end
end
