class OrdersController < ApplicationController
	before_action :set_order, only:[:show, :destroy, :update]

	def create
		@order=@current_user.orders.create(order_params)
		respond_to do |format|
			@order.save
			format.html {redirect_to categories_path, notice:"Order was placed Successfully"}		

		end
	end

	def show
		respond_to do |format|

			format.html{}
			format.js{}
		end
		
	end


	def index
		if @current_user.has_role? :admin
			@orders=Order.all
		else
			@orders=@current_user.orders.all
		end
	end


	def new
		@order=@current_user.orders.build
	end


	def update
		if @current_user.has_role? :admin
			@order.update(:status=>order_params[:status])
			@order.save
		end
	end


	def destroy
		@order.destroy
		respond_to do |format|
			format.html {redirect_to orders_path, notice:"Order was Deleted Successfully"}
		end		

	end


	private

	def order_params
		params.require(:order).permit(:delivery_address, :payment_type, :status)
	end

	def set_order
		@order=Order.find(params[:id])
	end

end
