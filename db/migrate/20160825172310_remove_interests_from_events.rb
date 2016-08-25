class RemoveInterestsFromEvents < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :interests, :string
  end
end
