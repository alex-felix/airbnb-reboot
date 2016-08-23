class AddStartAtToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :starts_at, :datetime
  end
end
