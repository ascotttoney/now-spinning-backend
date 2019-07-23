class AlbumSerializer < ActiveModel::Serializer
  attributes :id, :name, :release_date, :tracks, :images, :external_urls, :label
  belongs_to :artist
end
