class CustomerController < ApplicationController
  
  def index
    @customers = Customer.all
  end
  
  def create
    customer = Customer.new(customer_params)
    post.customer_id = current_customer.id
    customer.save
    redirect_to customer_path(customer.id)
  end
  
  def show
    @customer = Customer.find(params[:id])
  end

  def mypage 
    @customer = current_customer
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end
  
  def update
    customer = Customer.find(params[:id])
    if customer.update(customer_params)
    flash[:notice] = "You have updated costomer successfully." 
    redirect_to  mypage_customer_index_path
    else
    render :edit
    end
  end
  
  private
  def customer_params
    params.require(:customer).permit(:address, :comment, :evaluation, :customer_id, :star,:image)
  end
end

