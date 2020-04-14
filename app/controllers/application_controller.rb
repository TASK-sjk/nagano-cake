class ApplicationController < ActionController::Base
	before_action :authenticate_customer!, except: [:top, :about, :index]
	before_action :authenticate_admin!, except: [:top, :about, :index]
	before_action :configure_permitted_parameters, if: :devise_controller?
	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :kana_last_name, :kana_first_name, :postcode, :address, :phone_number ])
	end

	# 会員登録後に移動するviewの指定
	def after_sign_up_path_for(resource)
    	root_path
    end

    # ログイン後に移動するviewの指定
    def after_sign_in_path_for(resource)
    	if customer_signed_in?
    		root_path
    	elsif admin_signed_in?
    		admins_top_path
    	end
    end
	# ログアウト後に移動するviewの指定
    def after_sign_out_path_for(resource)
    	if resource == :admin
    		new_admin_session_path
    	elsif resource == :customer
    		root_path
    	end
    end
end
