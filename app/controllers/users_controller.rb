class UsersController < ApplicationController
  def new
    @user = User.new()
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in(@user)
      redirect_to root_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  # probably needs to go into the API:Users controller
  # def edit
  # end
  #
  # def update
  # end
  #
  # def show
  #   @user = user.find(params[:id])
  # end

  private
  def user_params
    # bio, location
    params.require(:user).permit(:username, :password, :email)
  end

end
