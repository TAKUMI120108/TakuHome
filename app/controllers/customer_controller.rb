class CustomerController < ApplicationController
  
  def index
    @customer = Customer.all

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

  def edit
    @customer = Customer.find(current_customer.id)
  end
  
  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to customer_path
  end
  
  private
  def customer_params
    params.require(:customer).permit(:address, :comment, :evaluation, :customer_id, :star)
  end
end

