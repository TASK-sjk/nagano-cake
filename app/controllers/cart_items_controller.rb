class CartItemsController < ApplicationController
before_action :setup_cart_item!, only: [:create]
  def index
  	@customer = current_customer
  	@cart_item = @customer.cart_items


  end

  def create
    if @cart_item.blank?
      @cart_item = current_customer.cart_items.build(item_id: params[:cart_item][:item_id], number: 0)
    end
    @cart_item.number += params[:cart_item][:number].to_i
    @cart_item.item_id = params[:cart_item][:item_id].to_i
    @cart_item.save!
    redirect_to cart_items_path
  end


  def new

  end

  def destroy
  	@cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
  	redirect_back(fallback_location: root_path)
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  private
   def cart_item_params
   	params.require(:cart_item).permit(:item_id, :customer_id, :number)
   end

   def setup_cart_item!
    @cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
  end

end

