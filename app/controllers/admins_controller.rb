class AdminsController < ApplicationController
  def index
  end

  def edit
  end

  def show
  end

  def search
    #Viewのformで取得したパラメータをモデルに渡す
    @range = params[:range]
    method = params[:search_method]
    search = params[:search_search]
    @customers = Customer.search(method,search)
    @items = Item.search(method,search)
  end
end
