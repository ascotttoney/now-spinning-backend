class AlbumsController < ApplicationController

  def index
    @albums = Album.all
    @albums = @albums.map { |u| AlbumSerializer.new(u) }
    render json: { albums: @albums }, status: :ok
  end

  def search
    results = RSpotify::Album.search(params[:title])
    render json: { albums: results }, status: :ok
  end

  # def search
  #   results = RSpotify::Album.search(params[:title])
  #   # p '---------'
  #   sorted_results = results.sort_by {|album| album.name }
  #   # p sorted_results
  #   render json: { albums: sorted_results }, status: :ok
  # end

end
