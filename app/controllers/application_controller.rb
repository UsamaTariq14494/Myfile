class ApplicationController < ActionController::Base
	before_action :current_cart

	def current_cart
		
		unless @current_cart
			if current_user
				@current_cart = Cart.where(:user => current_user).first_or_create
			elsif session[:cart_id]
				@current_cart = Cart.where(:id => session[:cart_id]).first || Cart.create
			else
				@current_cart = nil
			end
		end
		return @current_cart
	end

end
