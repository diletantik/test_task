class HomeController < ApplicationController
	def index
		@ticket = Ticket.new
		@new = TicketStatus.where('name = ?', 'Waiting for Staff Response').first
		if @new.present?
    		@tickets = @new.tickets
    	end
	end

end