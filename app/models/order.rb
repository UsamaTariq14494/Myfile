class Order < ApplicationRecord
	belongs_to :user
	has_many :order_items

	enum status: {waiting: 0, acknowledged: 1, dispatched: 2, delivered: 3}

	after_create :manage_order
	after_initialize :set_defaults

	private

	def set_defaults
		if self.new_record?
			self.status ||= :waiting
		end
	end

	def manage_order
		
		cart_items = CartItem.joins(:cart).where("carts.user_id = ?",user_id)
		cart_items.each do |cart_item|
			self.order_items.create(
				name: cart_item.product.name,
				price: cart_item.product.price,
				product_id: cart_item.product_id,
				category_id: cart_item.product.category_id,
				cart_item_id: cart_item.id
				)
				
		end
		cart_items.destroy_all
	end
end
