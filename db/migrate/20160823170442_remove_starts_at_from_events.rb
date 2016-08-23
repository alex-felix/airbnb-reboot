# frozen_string_literal: true
class RemoveStartsAtFromEvents < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :starts_at, :date
  end
end
