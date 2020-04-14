class Admins::CustomersController < ApplicationController
  def index
    p Customer.all
  	@customer = Customer.all
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def show
  	@customer = Customer.find(params[:id])
  end

  def update
  	@customer = Customer.find(params[:id])
  	@customer.update(customer_params)
  	redirect_to admins_customers_path
  end

  private
  def customer_params
  	params.require(:customer).permit(:first_name, :last_name, :kana_first_name, :kana_last_name, :pastcode, :address, :phone_namber, :email, :is_deleted)
  end
end
