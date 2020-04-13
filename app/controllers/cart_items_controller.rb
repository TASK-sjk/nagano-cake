class CartItemsController < ApplicationController
  def index
  	@customer = current_customer
  	@cart_item = @customer.cart_items

  end

  def create
  	@item = Item.find(params[:cart_item][:item_id])
  	@cart_item = current_customer.cart_items.new(cart_item)
  	@cart_item.item_id = @item.id
  	@cart_item.save
  	redirect_to current_customer.cart_items_path
  end

  def new

  end

  def destroy
  	@cart_item = CartItem.find(params[:id])
  	@cart_item
  end

  def destroy_all
  	Customer.find(current_customer.id).cart_items.destroy_all
  	redirect_back(fallback_location: root_path)

  def update_item
    @cart_item.update(number: params[:number].to_i)
    redirect_to current_cart_items_path
  end

　# カート詳細画面から、「削除」を押した時のアクション
  def delete_item
    @cart_item.destroy
    redirect_to current_cart_items_path
  end

  private
   def cart_item_params
   	params.require(:cart_item).permit(:item_id, :customer_id)
   end

end
