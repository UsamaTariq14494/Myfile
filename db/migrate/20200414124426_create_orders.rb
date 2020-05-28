class CreateOrders < ActiveRecord::Migration[6.0]
	def change
		create_table :orders do |t|

			t.string :delivery_address
			t.string :payment_type
			t.references :user
			t.integer :status
			t.timestamps
		end
	end
end
