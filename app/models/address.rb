class Address < ApplicationRecord
	belongs_to :customer

	validates :postcode, presence: true
	validates :place, presence: true
	validates :receiver, presence: true
end
