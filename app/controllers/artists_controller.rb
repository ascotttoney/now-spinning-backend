class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
    @artists = @artists.map { |u| ArtistSerializer.new(u) }
    render json: { artists: @artists }, status: :ok
  end

  def search
    results = RSpotify::Artist.search(params[:name])
    render json: { artists: results }, status: :ok
  end

end
