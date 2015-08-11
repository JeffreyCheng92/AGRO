class Api::UsersController < ApplicationController
  before_action :require_log_in

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
  end

  private
  def user_params
    params.require(:user).permit(:bio, :location)
  end
end
