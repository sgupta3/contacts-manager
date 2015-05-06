class ContactsController < ApplicationController

	before_action :require_login
	
	def index
		@contacts = current_user.contacts.all
		#@contacts = Contact.all
	end

	def show
		@user = User.find( current_user.id )
        @contact = Contact.find( params[:id] )
        unless is_users_contact( @user , @contact )
            redirect_to contacts_path
        end

	end

	def new
		@contact = Contact.new
	end

	def edit
		@contact = Contact.find(params[:id])
	end

	def create
		@user = User.find(current_user.id)
		@contact = @user.contacts.create(contact_params)
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
			if current_user == nil
            	redirect_to '/login'
       		 end
       	end

     def is_users_contact( user , contact )
        user.id == contact.user_id
    end
end

