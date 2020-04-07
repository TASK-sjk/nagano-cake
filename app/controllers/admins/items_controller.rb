class Admins::ItemsController < ApplicationController
  def index
  	@items = Item.all
  end

  def show
  	@item = Item.find(params[:id])
  end

  def new
  	@item = Item.new
  end

  def create
  	@item = Item.new(item_params)
  	if @item.save
  		redirect_to admins_items_path
  	else
  		render :new
  	end
  end

  def edit
  end

  private
  def item_params
  	params.require(:item).permit(:name, :price, :body, :image)
  end
end
