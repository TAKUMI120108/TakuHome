class SearchController < ApplicationController
  
  def new
    @search = Search.new
  end

  def index
    @q = Search.ransack(params[:q])
    @search = @q.result
    @searches = Search.all
    gon.users = Search.all
  end
  
  def map
    @search = Search.new
  end
  
  def mapshow
    @search = Search.new
  end
  
  def show
    @search = Search.find(params[:id])
  end

  def create
    @search = Search.new(search_params)
    if @search.save
      flash[:notice] = "保存に成功しました."
      redirect_to search_index_path
    else
      flash.now[:alert] = "保存に失敗しました."
      render :new
    end
  end

  def destroy
    search = Search.find(params[:id])
    search.destroy
    redirect_to search_index_path
  end

  def edit
    @search = Search.find(params[:id])
  end

  def update
    @search = Search.find(params[:id])
    if @search.update(search_params)
      flash[:notice] = "You have updated search successfully."
    redirect_to search_path(@search.id)
    else
     render :edit
    end
  end

  private
  def search_params
    params.require(:search).permit(:name, :address_prefecture, :address_city, :distance,:distance_time, :rent, :security_deposit, :key_money, :management_fee, :guarantee_charge, :image)
  end
  
  def set_ransack
    @q = Product.ransack(params[:q])
  end
end



