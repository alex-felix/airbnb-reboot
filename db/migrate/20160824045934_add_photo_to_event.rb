# frozen_string_literal: true
class AddPhotoToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :photo, :string
  end
end
