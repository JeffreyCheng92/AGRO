class Api::ReviewsController < ApplicationController
  def create

  end

  def update

  end

  def destroy

  end

  private
  def review_params
    params.require(:review).permit(:author_id, :game_id, :body)
  end

end
