class HomesController < ApplicationController
  def top
  	@categories = Category.where(status: "有効")
  end

  def about
  end

  def thanks
  end
end
