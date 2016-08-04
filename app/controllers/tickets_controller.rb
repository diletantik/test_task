class TicketsController < ApplicationController
  respond_to :html, :xml, :json
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def index
    @tickets = Ticket.all
    respond_with(@tickets)
  end

  def show
    @comment = Comment.new
    respond_with(@ticket)
    puts @comments
  end

  def new
    @ticket = Ticket.new
    respond_with(@ticket)
  end

  def edit
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @status = TicketStatus.where('name = ?', 'Waiting for Staff Response').first
    @ticket.ticket_status_id = @status.id
    if @ticket.valid?
      @ticket.save
      flash[:notice] = "We save your ticket. Check your email"
      UserMailer.new_ticket(@ticket).deliver
    else
       flash[:notice] = "smth wrong. check your data"
    end
    redirect_to :back
  end

  def update
    @ticket = Ticket.find(params[:id])
    @ticket.update(ticket_params)
    #UserMailer.change_status(@ticket).deliver
    redirect_to :back
  end

  def destroy
    @ticket.destroy
    respond_with(@ticket)
  end

  def open
    @new = TicketStatus.where('name = ?', 'Waiting for Customer').first
    @tickets = @new.tickets
  end

  def on_hold
    @new = TicketStatus.where('name = ?', 'On Hold').first
    @tickets = @new.tickets
  end

  def closed
    @cancelled = TicketStatus.where('name = ?', 'Cancelled').first
    @completed = TicketStatus.where('name = ?', 'Completed').first
    @tickets = @cancelled.tickets+@completed.tickets
  end

  private
    def set_ticket
      @ticket = Ticket.where('link = ?', params[:id]).first
    end

    def ticket_params
      params.require(:ticket).permit(:name, :email, :subject, :body, :ticket_status_id)
    end

    def comment_params
      params.require(:comment).permit(:comment, :user_id, :ticket_id)
    end

end
