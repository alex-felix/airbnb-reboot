# frozen_string_literal: true
class AddTimeToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :starts_at_time, :time
    add_column :events, :ends_at_time, :time
  end
end
