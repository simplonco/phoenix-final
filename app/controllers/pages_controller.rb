class PagesController < ApplicationController

	def index
		@pages = Page.all.order('position')
	end

	def show
    	@page = Page.find(params[:id])
  	end

  	def create
  		@contact = Contact.new(page_params)
  		@contact.save
  	end

  	private
 
	def page_params
		params.require(:contact).permit(:first_name, :last_name, :mail, :object, :message)
    end

end
