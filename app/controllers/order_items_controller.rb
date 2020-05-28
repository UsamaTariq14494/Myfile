class OrderItemsController < ApplicationController
#before_action :set_order
def show
	
end


def index
	byebug
@order_items=OrderItem.all
end


def set_order
	@order=Order.find(params[:id])
end

end
