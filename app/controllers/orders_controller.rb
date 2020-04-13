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
    @order = current_customer.order or Order.find(params[:id])
  end

  def info
  end
end
