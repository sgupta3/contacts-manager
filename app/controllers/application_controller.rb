class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  	def current_user
    	@current_user ||= User.find_by_email(session[:email]) if session[:email]
  	end

  	def is_logged_in
  	  current_user != nil
  	end
  
  helper_method :current_user, :is_logged_in

end
