class CustomerController < ApplicationController
before_action :is_matching_login_user, only: [:edit, :update]

  def index
    @customers = Customer.all
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
    if @customer.update(customer_params)
    flash[:notice] = "You have updated costomer successfully."
    redirect_to  mypage_customer_index_path
    else
    render :edit
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :address, :comment, :evaluation, :customer_id, :star,:image)
  end

  def is_matching_login_user
    @customer = Customer.find(params[:id])
    unless @customer.id == current_customer.id
     redirect_to request.referer
    end
  end
end

