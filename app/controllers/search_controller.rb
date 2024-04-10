class SearchController < ApplicationController
 def new
    @search = Search.new
 end

  def index
   @search = Search.all
   
  end

 def create
    search = Search.new(search_params)
    search.save
    redirect_to search_show_path(customer_id)
 end
  
  def show
  end
  
private
  def search_params
    params.require(:search).permit(:address, :price)
  end
end

