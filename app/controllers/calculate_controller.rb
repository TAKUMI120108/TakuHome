class CalculateController < ApplicationController
  def new
    @calculate = Calculate.new
  end
  
  def index 
  end 
  
  def show
   @calculate = Calculate.find params[:id] 
   @number1 = @calculate["home_pay"] 
   @number2 = @calculate["other_payment_amount"] 
   @number3 = @calculate["rent"] 
   @number4 = @calculate["security_deposit"] 
   @number5 = @calculate["key_money"] 
   @number6 = @calculate["management_fee"] 
   @number7 = @calculate["guarantee_charge"] 
   @hikizan = @number1 - @number2 - @number3 - @number4 - @number5 - @number6 - @number7
  end
  
  def create
    @calculate = Calculate.new(calculate_params)
    if @calculate.save
      flash[:notice] = "計算できました。"
    redirect_to calculate_path(@calculate)
    else
      flash.now[:alert] = "計算に失敗しました。"
      render :new
    end
  end
  
  private
  
   def calculate_params 
    params.require(:calculate).permit(:home_pay, :other_payment_amount, :rent,
    :security_deposit, :key_money, :management_fee, :guarantee_charge) 
   end
end
