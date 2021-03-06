class SessionsController < ApplicationController
	def new
		if is_logged_in
			redirect_to root_url
		end 
	end

	def create
		user = User.find_by_email(params[:email])
		if user && user.authenticate(params[:password])
			session[:email] = user.email
			redirect_to root_url
		else
			flash.now[:danger] = "Oops! Looks like you entered invalid email or password. Lets try again!"
			render "new"
		end
	end

	def destroy
		session[:email] = nil
		redirect_to root_url
	end
end
