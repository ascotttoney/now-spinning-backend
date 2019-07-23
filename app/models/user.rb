class User < ApplicationRecord
  validates :email, uniqueness: true

  has_many :reviews
  has_many :albums, through: :reviews

  has_many :collections
  has_many :saved, through: :collections, source: :album

  has_secure_password
end
