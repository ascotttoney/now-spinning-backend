class CollectionsController < ApplicationController

  def index
    @collections = Collection.all
    render json: @collections.to_json, status: :ok
  end

  def show
    @collection = Collection.find(params[:id, :user, :album])
    render json: CollectionSerializer.new(@collection), status: :ok
  end

  # def create
  #   @collection = Collection.new(user_id: params[:user.id], album_id: params[:album.id])
  #   if @collection.save
  #     render json: CollectionSerializer.new(@collection), status: :ok
  #   else
  #     render :errors
  #   end
  # end

end


# creat collection, album and artist when user saves album
# check if already saved
# check user (in store), then fetch to create
# check if artist already exists
# if so, create album and then collection
# if not, create artist, album, then collection
