class RemoveMisspeltFromLocations < ActiveRecord::Migration[5.0]
  def change
    remove_column :locations, :decription, :text
  end
end
