# frozen_string_literal: true
class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :user, :event, presence: true
end
