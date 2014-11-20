class PostsController < ApplicationController
  def new
    @post = Post.new
    render json: @post
  end
  
  def create
    @post = Post.new(post_params)
    
    if @post.save
      render json: @post
    else
      render json: @post.errors
    end
  end
  
  def edit
    @post = Post.find(params[:id])
    render json: @post
  end
  
  def update
    @post = Post.find(params[:id])
    
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors
    end
  end
  
  def index
    @posts = Post.all
    render json: @posts
  end
  
  def show
    @post = Post.find(params[:id])
    render json: @post
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy!
    render json: @post
  end
  
  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
