class Event < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5 }, uniqueness: { case_sensitive: true }
  validates :description, presence: true, length: { minimum: 25 }
  belongs_to :location
  belongs_to :user
  validates :user, :location, :start_time, :end_time, presence: true
  CATEGORIES = %w(outdoors citytrip sport nightlife home)
  validates :category, inclusion: { in: CATEGORIES }
end
