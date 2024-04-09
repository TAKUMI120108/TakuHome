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
  
private
  def post_params
    params.require(:post).permit(:address, :comment, :evaluation, :customer_id, :star)
  end
end
