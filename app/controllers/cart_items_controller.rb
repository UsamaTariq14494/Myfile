class CartItemsController < ApplicationController
	before_action :set_cart_item, only: [:destroy, :update, :edit]
	


	def create
		
		@cart_item = CartItem.where(:product_id => params[:cart_item][:product_id], :cart_id=> params[:cart_item][:cart_id]).first_or_create
		@cart_item.quantity = (@cart_item.quantity || 0) + cart_item_params[:quantity].to_i
		@cart_item.save
		#respond_to do|format|
			#if @cart_item 
				#format.html {redirect_to  shopping_cart_path, notice: 'Successfully Updated.' }
			#else
				#format.html { render :new }
			#end
		#end
	end


	def destroy
		@cart_item.destroy	
	end


	def update
		@cart_item.update(cart_item_params)
	end


	def edit
	end


	def set_cart_item
		@cart_item = CartItem.find_by_id(params[:id])
	end


	def cart_item_params
		params.require(:cart_item).permit(:quantity,:product_id,:cart_id)
	end

end
