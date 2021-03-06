class ArtistsController < ApplicationController

  def index
    if !params[:artist_name].empty?
      @artists = RSpotify::Artist.search(params[:artist_name])
    else
      redirect_to root_path
    end
  end

  def show
    @artist = RSpotify::Artist.find(params[:id])
  end
end
