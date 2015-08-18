class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def log_in(user)
    session[:session_token] = user.reset_session_token
  end

  def log_out
    current_user.reset_session_token
    session[:session_token] = nil
  end

  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def require_log_in
    if flash[:is_logging_out]
      flash.discard
      redirect_to new_session_url
    elsif !logged_in?
      flash[:errors] = "Please log in or proceed as guest."
      redirect_to new_session_url
    end
  end

end
