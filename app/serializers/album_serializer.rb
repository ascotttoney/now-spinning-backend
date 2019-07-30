class AlbumSerializer < ActiveModel::Serializer
  attributes :id, :spotify_id, :title, :artist, :cover
end
