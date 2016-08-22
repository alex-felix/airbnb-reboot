class AddStuffToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :full_name, :string
    add_column :users, :address, :string
    add_column :users, :postcode, :string
    add_column :users, :country, :string
    add_column :users, :phone_number, :string
    add_column :users, :gender, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :interests, :string, array: true, default: []
    add_column :users, :admin, :boolean
  end
end
