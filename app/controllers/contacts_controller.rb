class ContactsController < ApplicationController

	before_action :require_login
	
	def index
		@contacts = current_user.contacts.all
	end

	def show
        @contact = current_user.contacts.find_by_id( params[:id] )
        unless @contact
        	flash[:info] = "Oh snap! The contact doesn't exist in your contact book!"
            redirect_to contacts_path
        end

	end

	def new
		@contact = current_user.contacts.new
	end

	def edit
		@contact = current_user.contacts.find_by_id(params[:id])
		 unless @contact
        	flash[:info] = "Oh snap! The contact doesn't exist in your contact book!"
            redirect_to contacts_path
        end
	end

	def create
		@contact = current_user.contacts.create(contact_params)
		redirect_to @contact
	end

	def update
		@contact = current_user.contacts.find(params[:id])
		if @contact.update(contact_params)
    		redirect_to @contact
    	end
	end

	def destroy 
		@contact = current_user.contacts.find(params[:id])
		@contact.destroy
		redirect_to contacts_path
	end

	private
		def contact_params
			params.require(:contact).permit(:first_name,:last_name,:email,:phone)
		end

	private 
		def require_login
			if current_user == nil
            	redirect_to '/login'
       		 end
       	end
end

