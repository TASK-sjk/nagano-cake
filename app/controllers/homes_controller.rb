class HomesController < ApplicationController
  def top
  	@categories = Category.where(status: "有効")
  	@itema = Item.where(item_id: params[1])
  end

  def about
  end

  def thanks
  end
end
