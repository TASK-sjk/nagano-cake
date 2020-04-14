class Item < ApplicationRecord

	attachment :image

	belongs_to :category
	has_many :cart_items

	has_many :order_items
	has_many :orders, through: :order_items

	enum status: {販売中: 0, 売り切れ: 1}

	validates :name, presence: true
	validates :price, presence: true

	def self.search(method,search)
		if method == "forward_match"
			@items = Item.where("name LIKE?","#{search}%")
		elsif method == "backward_match"
			@items = Item.where("name LIKE?","%#{search}")
		elsif method == "perfect_match"
			@items = Item.where("name LIKE?","#{search}")
		elsif method == "partial_match"
			@items = Item.where("name LIKE?","%#{search}%")
		else
			@items = Item.all
		end
	end
end
