class CustomersController < ApplicationController
  def edit
  	@customer = current_customer
  end

  def show
  	@customer = current_customer
  end

  def update
  	customer = current_customer
  	customer.update(customer_params)
  	if customer.save
  		flash[:update] = "You have updated customer successfully."
  		redirect_to customers_path
  	else
  		render 'edit'
  	end
  end

  def hide
  	@customer = current_customer
  	#is_deletedカラムにフラグを立てる(defaultはfalse)
  	@customer.update(is_deleted: true)
  	#ログアウトさせる
  	reset_session
  	flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
  	redirect_to root_path
  end

  def leave
  	@customer = current_customer
  end

  private
  def customer_params
  	params.require(:customer).permit(:email, :password, :first_name, :last_name, :kana_first_name, :kana_last_name, :address, :postcode, :phone_number, :is_deleted)
  end
end
