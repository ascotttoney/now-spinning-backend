class ReviewsController < ApplicationController

  def index
    reviews = Review.all
    render json: reviews.to_json, status: :ok
  end

  def show
    review = Review.find(params[:id, :user, :album])
    render json: ReviewSerializer.new(Review), status: :ok
  end

end
