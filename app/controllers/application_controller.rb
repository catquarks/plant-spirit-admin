class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :authorize_user

  def home
  end

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
  	!!current_user
  end

  def authorize_user
  	if !logged_in?
  		flash[:notice] = "You must be logged in to do this!"
  		redirect_to login_path
  	end
  end

  def record_history(last_action_performed)
  	current_user.add_to_history(last_action_performed)
  end

end
