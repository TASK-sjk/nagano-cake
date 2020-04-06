class Admins::ItemsController < ApplicationController
  def index
  	@order = Order.all
  end

  def show
  end
end
