class Item < ApplicationRecord

	attachment :image

	belongs_to :category
	has_many :cart_items

	has_many :order_items
	has_many :orders, through: :order_items

	enum status: {販売中: 0, 売り切れ: 1}

	validates :name, presence: true
	validates :price, presence: true
end
