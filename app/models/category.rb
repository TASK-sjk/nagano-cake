class Category < ApplicationRecord
	has_many :items

	validates :name, presence: true

	enum status: {有効:true, 無効:false}
end
