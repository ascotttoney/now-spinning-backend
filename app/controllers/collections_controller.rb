class CollectionsController < ApplicationController

  def index
    collections = Collection.all
    render json: collections.to_json, status: :ok
  end

  def show
    collection = Collection.find(params[:id, :user, :album])
    render json: { collection: CollectionSerializer.new(collection) }, status: :ok
  end

  def user
    collections = Collection.all.select { |collection| collection.user_id.to_s == params[:user_id] }
    serialized_collections = collections.map { |collection| CollectionSerializer.new(collection) }
    render json: { collections: serialized_collections }, status: :ok
  end

  def create
    collection = Collection.new(collection_params)
    userCheck = Collection.find_by(user_id: params[:collection][:user_id])
    albumCheck = Collection.find_by(album_id: params[:collection][:album_id])

    if userCheck && albumCheck
      render json: { errors: collection.errors }
    else
      collection.save
      render json: { collection: CollectionSerializer.new(collection) }, status: :ok
    end
  end

  def destroy
    collection = Collection.find(params[:id])
    if collection.delete
      render json: { message: "Delete successful" }
    else
      render json: { errors: collection.errors }
    end
  end


  private

  def collection_params
    params.require(:collection).permit(:user_id, :album_id)
  end


end
