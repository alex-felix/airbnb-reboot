class AddInterestsToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :interests, :string
  end
end
