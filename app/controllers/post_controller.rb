class PostController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    if @post.save
     flash[:notice] = "投稿に成功しました。"
     redirect_to post_path(@post.id)
    else
     flash.now[:alert] = "投稿に失敗しました。"
     render :new
    end
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
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "You have updated post successfully."
    redirect_to post_path(@post.id)
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
    params.require(:post).permit(:address, :comment, :evaluation, :star)
  end
  
  def is_matching_login_user
    @post = Post.find(params[:id])
    unless @post.customer.id == current_customer.id
     redirect_to request.referer
    end
  end
end
