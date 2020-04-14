class CartItem < ApplicationRecord
	belongs_to :customer
	belongs_to :item, optional: true

	validates :item_id, presence: true
	validates :customer_id, presence: true
	validates :number, presence: true
end

