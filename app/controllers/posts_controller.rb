class PostsController < ApplicationController
  
  before_filter :require_user, :only => [:new]  
  
  # GET /posts
  def index
    @posts = Post.ordered
  end

  # GET /posts/1
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # POST /posts
  def create
    @post = Post.new(params[:post])
      if @post.save
        flash[:notice] = 'Post was successfully created.'
        redirect_to(@post)       
      else
        render :action => "new"
      end
  end
  
  def add_comment
    @post = Post.find(params[:id])
    @comment = Comment.new(params[:comment])
    @comment.post_id = @post.id
    if @comment.save
      flash[:notice] = 'Comment was successfully created.'
      redirect_to(@post)
    else
      #TODO: do this redirect to the same page & show errors
      render :action => 'show'
    end
  end
  
end
