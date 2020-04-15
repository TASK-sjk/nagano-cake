class OrderItemsController < ApplicationController
	def index
		cart_items = current_customer.cart_items
		if cart_items.blank?
			flash[:notice] = "カートは空です"
			redirect_to items_path
		else
			cart_items.each do |cart_item|
				order_item = OrderItem.find_by(item_id: cart_item.item_id, order_id: 0)
				if order_item.nil?
					order_item.item_id = cart_item.item_id
					order_item.item.count = cart.count
					order_item.item.price = cart_item.item.price
					order_item.order_id = 0
					order_item.save
				else
					order_item.number = cart_item.number
					order_item.sold_price = cart_item.item.price
					order_item.save
				end
			end
		end
		redirect_to order_confirm_path

	end


	def create
		cart_items = current_customer.cart_items
		if cart_items.blank?
			flash[:notice] = "カートは空です"
			redirect_to items_path
		else
			cart_items.each do |cart_item|
				order_item = OrderItem.find_by(item_id: cart_item.item_id, order_id: 0)
				if order_item.nil?
					order_item = OrderItem.new
					order_item.item_id = cart_item.item_id
					# order_item.item.count = cart_items.count
					order_item.item.price = cart_item.item.price
					order_item.order_id = 0
					order_item.save
				else
					order_item.number = cart_item.number
					order_item.sold_price = cart_item.item.price
					order_item.save
				end
			end
		end
		redirect_to info_path


	end
end


