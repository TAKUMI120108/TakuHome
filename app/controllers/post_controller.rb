class PostController < ApplicationController
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer_id
    @post.save
    redirect_to view_path(customer_id)
  end
  
private
  def post_params
    params.require(:book).permit(:address, :comment, :evaluation, :customer_id, :star)
  end
end
