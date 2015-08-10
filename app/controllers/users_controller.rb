class UsersController < ApplicationController
  def new
    @user = User.new()
  end

  def create
    @user = User.new(user_params)

    # if user saves, log them in, else render errors
  end

  def edit
  end

  def update
  end

  def show

  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :bio, :email, :location)
  end

end
