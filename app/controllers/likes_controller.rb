class LikesController < ApplicationController
  def create
    @like = current_user.likes.new(like_params)

    if @like.save
      render json: @like
    else
      render json: @like.errors.full_messages, status: 422
    end
  end

  def update
    @like = Like.find(params[:id])

    if @like.update(like_params)
      render json: @like
    else
      render json: @like.errors.full_messages, status: 422
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    render json: @like
  end

  private

  def like_params
    params.require(:like).permit(:review_id, :value)
  end
end
