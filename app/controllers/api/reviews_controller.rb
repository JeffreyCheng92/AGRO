class Api::ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)

    if @review.save
      render json: @review
    else
      render json: @review.errors.full_messages, status: 422
    end
  end

  def update
    @review = Review.find(params[:id])

    if @review.update(review_params)
      render json: @review
    else
      render @review.errors.full_messages, status: 422
    end
  end

  def destroy

  end

  private
  def review_params
    params.require(:review).permit(:author_id, :game_id, :body, :rating)
  end

end
