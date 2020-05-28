class CreateOrderItems < ActiveRecord::Migration[6.0]
	def change
		create_table :order_items do |f|
			f.references :order
			f.references :cart_item
			f.references :product
			f.references :category
			f.string :name
			f.integer :price
			f.timestamps
		end
	end
end
