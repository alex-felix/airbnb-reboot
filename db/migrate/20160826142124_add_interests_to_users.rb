class AddInterestsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :interests, :string
  end
end
