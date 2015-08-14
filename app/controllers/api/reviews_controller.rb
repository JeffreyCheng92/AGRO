class Api::ReviewsController < ApplicationController
  def index
    @reviews = Review.all;
  end

  def create
    @review = current_user.reviews.new(review_params)

    if @review.save
      render :show
    else
      render json: @review.errors.full_messages, status: 422
    end
  end

  def update
    @review = Review.find(params[:id])

    if @review.update(review_params)
      render json: @review
    else
      render json: @review.errors.full_messages, status: 422
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy()
  end

  private
  def review_params
    params.require(:review).permit(:game_id, :body, :rating)
  end

end
