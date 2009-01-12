class CommentsController < ApplicationController

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # POST /comments
  def create
    params[:comment][:author] ? params[:comment][:author] : 'Anonim'
    @comment = Comment.new(params[:comment])
    if @comment.save
      flash[:notice] = 'Comment was successfully created.'
      redirect_to(@comment.post)
    else
      #TODO: do this redirect to the same page & show errors
      redirect_to(@comment.post)
    end
  end

end
