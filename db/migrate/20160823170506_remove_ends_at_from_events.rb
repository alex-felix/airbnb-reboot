class RemoveEndsAtFromEvents < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :ends_at, :date
  end
end
