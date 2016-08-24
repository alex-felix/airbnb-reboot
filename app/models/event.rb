# frozen_string_literal: true
class Event < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  geocoded_by :address

  has_many :attendances
  has_many :users, through: :attendances
  # belongs_to :location
  belongs_to :user

  after_validation :geocode, if: :address_changed?
  validates :title, presence: true, length: { minimum: 5 }, uniqueness: { case_sensitive: true }
  validates :description, presence: true, length: { minimum: 5 }
  validates :user, :starts_at_day, :ends_at_day, presence: true
  # validates :interests, inclusion: { in: %w(outdoors citytrip sport nightlife home) }
end
