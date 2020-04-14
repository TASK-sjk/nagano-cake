class Order < ApplicationRecord
	belongs_to :customer

	has_many :order_items
	has_many :items, through: :order_items

	enum status: {
		入金待ち: 0,
		入金確認: 1,
		製作中: 2,
		発送準備中: 3,
		発送済み: 4,
	}

	enum pay_type: {
		銀行振込: 0,
		クレジットカード: 1,
	}

    def total_price
		items.to_a.sum { |item| item.total_price }
	end
end
