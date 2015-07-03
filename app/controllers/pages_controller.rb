class PagesController < ApplicationController

	def index
		@pages = Page.all.order('position')
    @contacts = Contact.all
	end

	def show
  	@page = Page.find(params[:id])
    redirect_to root_path
	end

	def create
		@contact = Contact.new(page_params)
		@contact.save
    ContactMailer.send_mail(@contact).deliver_now
    redirect_to root_path
	end

	private
 
	def page_params
		params.require(:contact).permit(:first_name, :last_name, :mail, :object, :message)
  end

end
