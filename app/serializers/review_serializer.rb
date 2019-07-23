class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :rating
  has_one :album
  has_one :user
end
