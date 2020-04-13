class Admins::OrdersController < ApplicationController
  def index
  	@order = Order.find(params[:id])
  end

  def show
  	@order_item = OrderItems.find(params[:id])
  	@order = Order.find(params[:id])
  end

private
	def order_item_params
		params.require(:order_item).permit(:customer_id, :item_id)

end
