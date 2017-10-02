class CreateProperties < ActiveRecord::Migration[5.0]
	def change
		create_table :properties do |t|
			t.string :address
			t.string :type
			t.float :price
			t.float :value
			t.belongs_to :contact
			t.timestamps
		end
	end
end
