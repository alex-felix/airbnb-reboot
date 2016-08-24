# frozen_string_literal: true
class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.text :decription
      t.string :address
      t.string :postcode
      t.string :country
      t.integer :capacity

      t.timestamps
    end
  end
end
