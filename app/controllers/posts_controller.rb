class PostsController < ApplicationController
  # GET /posts
  def index
    @posts = Post.ordered
  end

  # GET /posts/1
  def show
    @post = Post.find(params[:id])
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
  
end
