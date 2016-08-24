class AddColumsToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :address, :string
    add_column :events, :postcode, :string
    add_column :events, :city, :string
  end
end
