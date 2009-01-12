class CommentsController < ApplicationController

  # GET /comments/new
  # GET /comments/new.xml
  def new
    @comment = Comment.new
  end

  # POST /comments
  def create
    @comment = Comment.new(params[:comment])
      if @comment.save
        flash[:notice] = 'Comment was successfully created.'
        redirect_to(@comment.post)
      else
        render :action => "new"
      end
  end

end
