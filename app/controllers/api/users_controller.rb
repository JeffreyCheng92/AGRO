class Api::UsersController < ApplicationController
  before_action :require_log_in, only: :update

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors.full_messsages, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])

    if @user
      render :show
    else
      render json: @user, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:bio, :location)
  end
end
