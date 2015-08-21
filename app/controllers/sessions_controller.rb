class SessionsController < ApplicationController
  def new
    @user = User.new()
  end

  def create
    @user = User.find_by_credentials(params[:user][:username],
                                     params[:user][:password])
    if @user
      log_in(@user)
      redirect_to root_url
    else
      @user = User.new({username: params[:user][:username]})
      flash.now[:errors] = "Invalid credentials."
      render :new
    end
  end

  def destroy
    log_out
    flash[:is_logging_out] = true
    render json: @user
  end
end
