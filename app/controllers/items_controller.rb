class ItemsController < ApplicationController
  def index
    @customer = current_customer
    @categories = Category.all
  end

  def create
  end

  def new
  end

  def edit
  end

  def show
    @customer = current_customer
  end

  def update
  end

  def destroy
  end
end
