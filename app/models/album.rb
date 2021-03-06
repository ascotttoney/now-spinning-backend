class Album < ApplicationRecord
  has_many :reviews
  has_many :reviewers, through: :reviews, source: :user

  has_many :collections
  has_many :owners, through: :collections, source: :user
end
