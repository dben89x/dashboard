class AddFieldsToContacts < ActiveRecord::Migration[5.0]
	def change
		add_column :contacts, :email, :string
		add_column :contacts, :project, :string
		add_column :contacts, :business, :string
		add_column :contacts, :date_met, :date
		add_column :contacts, :last_contacted, :date
		add_column :contacts, :where_met, :string
		add_column :contacts, :last_name, :string
		add_column :contacts, :notes, :text
		rename_column :contacts, :name, :first_name
	end
end
