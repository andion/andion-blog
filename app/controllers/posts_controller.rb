class PostsController < ApplicationController
  
  before_filter :require_user, :only => [:new,:edit]
  
  # GET /posts
  def index
    @posts = Post.ordered.paginate :page => params[:page]
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

  # GET /posts/:id/edit
  def edit
    @post = Post.find(params[:id])
  end

  # PUT /posts/:id
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:notice] = 'El post ha sido actualizado correctamente'
      redirect_to @post
    else
      flash[:error] = 'No se puede actualizar el postest'
      render :action => 'edit'
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
