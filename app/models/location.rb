class Location < ApplicationRecord
  validates :title, :description, :address, :city, presence: true
  validates :postcode, presence: true, format: {
    with: /\A([A-PR-UWYZ0-9][A-HK-Y0-9][AEHMNPRTVXY0-9]?[ABEHMNPRVWXY0-9]? {1,2}[0-9][ABD-HJLN-UW-Z]{2}|GIR 0AA)\z/,
    message: "invalid poscode"
  }
end
