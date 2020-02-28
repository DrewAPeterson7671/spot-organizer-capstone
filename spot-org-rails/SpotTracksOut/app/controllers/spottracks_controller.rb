class SpotTracksController < ApplicationController

  def index
    @spottracks = {"spottrack": "Synchronicity II"}
    json_response(@spottracks)
  end

  private
  def json_response(object, status = :ok)
    render json: object, status: status
  end
end     
