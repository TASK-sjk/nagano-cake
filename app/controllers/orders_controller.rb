class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def create
  end

  def new
  end

  def show
    customer = current_customer
    @order = Order.find(params[:id])
    @orders = Order.where(params[:id])
  end

  def info
    @order = 
  end
end
