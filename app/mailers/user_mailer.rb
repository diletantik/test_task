class UserMailer < ActionMailer::Base
  default from: "sergiytest895@gmail.com"
 
  def new_ticket(ticket)
    @ticket = ticket
    @url  = root_path+@ticket.link
    mail(to: @ticket.email, subject: 'New Ticket On TicketTracker')
  end

   def new_comment(ticket)
    @ticket = ticket
    @url  = root_path+@ticket.link
    mail(to: @ticket.email, subject: 'Check New Comment To '+@ticket.link)
  end

  def change_status(ticket)
    @ticket = ticket
    @url  = root_path+@ticket.link
    mail(to: @ticket.email, subject: 'Your Tickets status changed'+@ticket.link)
  end
end
