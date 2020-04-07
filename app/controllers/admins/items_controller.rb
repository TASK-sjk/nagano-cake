class Admins::ItemsController < ApplicationController
  def index
  end

  def show
  end

  def new
  	@item = Item.new
  end

  def create
  	@item = Item.new(item_params)
  	if @item.save
  		redirect_to admins_items_path
  	else
  		render 'index'
  	end
  end

  def edit
  end

  private
  def item_params
  	params.require(:item).permit(:name, :price, :body, :image)
  end
end
