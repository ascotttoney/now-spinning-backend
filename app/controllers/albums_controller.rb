class AlbumsController < ApplicationController

  def index
    @albums = Album.all
    @albums = @albums.map { |u| AlbumSerializer.new(u) }
    render json: { albums: @albums }, status: :ok
  end

  def create
    @album = Album.new(album_params)
    @check = Album.find_by(spotify_id: params[:album][:spotify_id])

    if @check
      render json: { album: AlbumSerializer.new(@check) }, status: :ok
    else
      @album.save
      render json: { album: AlbumSerializer.new(@album) }, status: :ok
    end
  end

  def search
    results = RSpotify::Album.search(params[:title])
    render json: { albums: results }, status: :ok
  end

  def details
    results = RSpotify::Album.find(params[:id])
    render json: { details: results }, status: :ok
  end


  private

  def album_params
    params.require(:album).permit(:spotify_id, :title, :artist, :cover)
  end

end
