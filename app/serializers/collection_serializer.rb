class CollectionSerializer < ActiveModel::Serializer
  attributes :id, :user, :album
  has_one :user
  has_one :album
end
