class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by_email(params[:email])
		if user && user.authenticate(params[:password])
			session[:email] = user.email
			redirect_to Contact.new, :notice => "Logged in!"
		else
			flash.now.alert = "Invalid email or password"
			render "new"
		end
	end

	def destroy
		session[:email] = nil
		redirect_to root_url, :notice => "Logged out!"
	end
end
