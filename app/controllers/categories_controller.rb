class CategoriesController < ApplicationController
  def index
    @category = Category.new
    @categories = Category.all
  end

  def create
    @category = Category.new(params[ :id])
    @category.save
    redirect_to categories_path
  end

  def new
  end

  def edit
    @category = Category.find(params[ :id])
  end

  def update
    category = Category.find(params[ :id])
    category.update(category_params)
    redirect_to categories_path
  end

  def destroy
  end

  private
  def category_params
    params.require(:category).permit(:name, :status)
  end
end
