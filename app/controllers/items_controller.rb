class ItemsController < ApplicationController
  def index
    @customer = current_customer
    @categories = Category.where(status: "有効")
    @items =Item.all
    if params[:category_id]
      @items = Item.where(category_id: params[:category_id])
      @category = Category.find(params[:category_id])
    end
  end

  def create
  end

  def new
  end

  def edit
  end

  def show
    @customer = current_customer
    @categories = Category.where(status: "有効")
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def update
  end

  def destroy
  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :body, :image, :category_id ,:status, :number)
  end
end
