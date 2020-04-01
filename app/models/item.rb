class Item < ApplicationRecord
	belongs_to :category
	has_many :cart_items

	has_many :order_items
	has_many :orders, through: :order_items

	validates :name, presence: true
	validates :price, presence: true
end
