class CalculateController < ApplicationController
  def new
    @calculate = Calculate.new
  end
  
  def index 
  end 
  
  def show
   @calculate = Calculate.find params[:id] 
   @number1 = @calculate["home_pay"] 
   @number2 = @keisan["other_payment_amount"] 
   @number3 = @keisan["rent"] 
   @number4 = @keisan["security_deposit"] 
   @number5 = @keisan["key_money"] 
   @number6 = @keisan["management_fee"] 
   @number7 = @keisan["guarantee_charge"] 
   @hikizan = @number1 - @number2 + @number3 + @number4 + @number5 + @number6 + @number7
  end
  
  def create
    calculate = Calculate.new(calculate_params)
    calculate.save
    redirect_to calculate_path(calculate.id)
  end
  
  private
  
   def calculate_params 
    params.require(:calculate).permit(:home_pay, :other_payment_amount, :rent,
    :security_deposit, :key_money, :management_fee, :guarantee_charge) 
   end
end
