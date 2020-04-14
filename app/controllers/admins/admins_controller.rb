class Admins::AdminsController < ApplicationController
	def top
		@counter =Order.where(created_at: Time.zone.today.beginning_of_day..Time.zone.today.end_of_day).count
	end
end
