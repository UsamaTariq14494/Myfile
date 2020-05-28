class CreateCarts < ActiveRecord::Migration[6.0]
	def change
		create_table :carts do |t|

			t.references :user	
			t.timestamps
		end
	end
end
