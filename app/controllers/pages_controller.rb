class PagesController < ApplicationController

	def index
		@pages = Page.all.order('position')
	end

	def show
    	@page = Page.find(params[:id])
  	end

  	private
 
	def page_params
		params.require(:page).permit(:title, :subtitle, :body)
    end

end
