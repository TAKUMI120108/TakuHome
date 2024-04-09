class CustomerController < ApplicationController
  def show
    @customer = Customer.new
    
  end

  def edit
    @customer = Customer.find(params[:id])
  end
end
