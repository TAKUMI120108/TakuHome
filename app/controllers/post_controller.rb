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
    if post.update(post_params)
      flash[:notice] = "成功してるよー"
    redirect_to post_index_path
    else
    render :edit
    end
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to post_index_path
  end
  
private
  def post_params
    params.require(:post).permit(:address, :comment, :evaluation, :customer_id, :star)
  end
end
