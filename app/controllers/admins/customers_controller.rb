class Admins::CustomersController < ApplicationController
  def index
  	@customer = Customer.all
  end

  def edit
  	@customer = current_customer
  end

  def show
  	@customer = current_customer
  end

  def update
  	customer = Customer.find(params[ :id])
  	customer.update(customer_params)
  	redirect_to admins_customers_path(customer.id)
  end

  private
  def customer_params
  	params.require(:customer).permit(:first_name, :last_name, :kana_first_name, :kana_last_name, :pastcode, :address, :phone_namber, :email)
  end
end
