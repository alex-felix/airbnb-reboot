# frozen_string_literal: true
class AddColumnToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :starts_at_day, :date
    add_column :events, :ends_at_day, :date
  end
end
