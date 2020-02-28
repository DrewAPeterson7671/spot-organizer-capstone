class SpotTracksController < ApplicationController
  before_action :set_spot_track, only: [:show, :edit, :update, :destroy]

  # GET /spot_tracks
  # GET /spot_tracks.json
  def index
    @spot_tracks = SpotTrack.all
  end

  # GET /spot_tracks/1
  # GET /spot_tracks/1.json
  def show
  end

  # GET /spot_tracks/new
  def new
    @spot_track = SpotTrack.new
  end

  # GET /spot_tracks/1/edit
  def edit
  end

  # POST /spot_tracks
  # POST /spot_tracks.json
  def create
    @spot_track = SpotTrack.new(spot_track_params)

    respond_to do |format|
      if @spot_track.save
        format.html { redirect_to @spot_track, notice: 'Spot track was successfully created.' }
        format.json { render :show, status: :created, location: @spot_track }
      else
        format.html { render :new }
        format.json { render json: @spot_track.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spot_tracks/1
  # PATCH/PUT /spot_tracks/1.json
  def update
    respond_to do |format|
      if @spot_track.update(spot_track_params)
        format.html { redirect_to @spot_track, notice: 'Spot track was successfully updated.' }
        format.json { render :show, status: :ok, location: @spot_track }
      else
        format.html { render :edit }
        format.json { render json: @spot_track.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spot_tracks/1
  # DELETE /spot_tracks/1.json
  def destroy
    @spot_track.destroy
    respond_to do |format|
      format.html { redirect_to spot_tracks_url, notice: 'Spot track was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spot_track
      @spot_track = SpotTrack.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spot_track_params
      params.fetch(:spot_track, {})
    end
end
