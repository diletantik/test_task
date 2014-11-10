class SearchController < ApplicationController
	def search_ticket
		@link = params[:link]
		@ticket = Ticket.where('link = ?', @link).first
		if @ticket.present?
			redirect_to "/tickets/"+@ticket.link
		elsif
			@ticket = Ticket.where('subject = ?', @link).first
			if @ticket.present?
				redirect_to "/tickets/"+@ticket.link
			end
		else
			flash[:notice] = 'Sorry. Try again please'
			redirect_to :back
		end
	end
end