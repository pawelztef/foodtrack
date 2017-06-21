class Backend::TracksController < ApplicationController
  before_action :set_backend_track, only: [:show, :edit, :update, :destroy]

  # GET /backend/tracks
  # GET /backend/tracks.json
  def index
    @backend_tracks = Backend::Track.all
  end

  # GET /backend/tracks/1
  # GET /backend/tracks/1.json
  def show
  end

  # GET /backend/tracks/new
  def new
    @backend_track = Backend::Track.new
  end

  # GET /backend/tracks/1/edit
  def edit
  end

  # POST /backend/tracks
  # POST /backend/tracks.json
  def create
    @backend_track = Backend::Track.new(backend_track_params)

    respond_to do |format|
      if @backend_track.save
        format.html { redirect_to @backend_track, notice: 'Track was successfully created.' }
        format.json { render :show, status: :created, location: @backend_track }
      else
        format.html { render :new }
        format.json { render json: @backend_track.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /backend/tracks/1
  # PATCH/PUT /backend/tracks/1.json
  def update
    respond_to do |format|
      if @backend_track.update(backend_track_params)
        format.html { redirect_to @backend_track, notice: 'Track was successfully updated.' }
        format.json { render :show, status: :ok, location: @backend_track }
      else
        format.html { render :edit }
        format.json { render json: @backend_track.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backend/tracks/1
  # DELETE /backend/tracks/1.json
  def destroy
    @backend_track.destroy
    respond_to do |format|
      format.html { redirect_to backend_tracks_url, notice: 'Track was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_backend_track
      @backend_track = Backend::Track.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def backend_track_params
      params.fetch(:backend_track, {})
    end
end
