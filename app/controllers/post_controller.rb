class PostController < ApplicationController
  def new
    @post = Post.new
  end
  
  def create
    post = Post.new(post_params)
    post.customer_id = current_customer.id
    post.save
    redirect_to post_path(post.id)
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def index
    @posts = Post.all
  end
  
  def edit
    @post = Post.find(params[:id])
    
  end
  
  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post.id)
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to post_index_path
  end
  
private
  def post_params
    params.require(:post).permit(:address, :comment, :evaluation, :star)
  end
end
