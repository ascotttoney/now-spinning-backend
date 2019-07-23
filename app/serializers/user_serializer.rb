class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name, :profile_picture
  has_many :reviews
  has_many :saved
end
