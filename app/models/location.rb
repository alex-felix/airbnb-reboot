# frozen_string_literal: true
class Location < ApplicationRecord
  has_many :events
  validates :name, :description, :address, :city, :postcode, presence: true
  validates :postcode, format: {
    with: /\A([A-PR-UWYZ0-9][A-HK-Y0-9][AEHMNPRTVXY0-9]?[ABEHMNPRVWXY0-9]? {1,2}[0-9][ABD-HJLN-UW-Z]{2}|GIR 0AA)\z/,
    message: 'invalid poscode'
  }
end
