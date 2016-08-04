class CommentsController < ApplicationController
  
  def create
    @comment = Comment.new(comment_params)
    @ticket = Ticket.find(@comment.ticket_id)
    if @comment.valid?
      @comment.save
      UserMailer.new_comment(@ticket).deliver
    else
      flash[:notice] = "Your comment is wrong"
    end
    redirect_to :back
  end
end
