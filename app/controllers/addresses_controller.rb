class AddressesController < ApplicationController
  def index
    @address = Address.new
    @address = Address.all
  end

  def create
    @address = Address.new(address_path)
    @address.save
    redirect_to addresses_path
  end

  def new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def address_params
    params.require(:address).permit(:postcode, :place, :receiver)
  end
end
