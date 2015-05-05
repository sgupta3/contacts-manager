class ContactsController < ApplicationController

	before_action :require_login
	
	def index
		@contacts = Contact.all
	end

	def show
		@contact = Contact.find(params[:id])
		@gravatar_email_hash = Digest::MD5.hexdigest(@contact.email)
	end

	def new
		@contact = Contact.new
	end

	def edit
		@contact = Contact.find(params[:id])
	end

	def create
		@contact = Contact.new(contact_params)

		@contact.save
		redirect_to @contact
	end

	def update
		@contact = Contact.find(params[:id])

		if @contact.update(contact_params)
    		redirect_to @contact
    	end
	end

	def destroy 
		@contact = Contact.find(params[:id])
		@contact.destroy
		redirect_to contacts_path
	end

	private
		def contact_params
			params.require(:contact).permit(:first_name,:last_name,:email,:phone)
		end

	private 
		def require_login
			unless current_user != nil
            	redirect_to '/login'
       		 end
       	end
end
