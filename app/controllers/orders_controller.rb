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
    @customer = current_customer
  end

  private
   def order_params
    params.require(:order).permit(:pay_type, :place, :postcode, :receiver, :total_price, :shipping_fee, :customer_id)
   end
end
