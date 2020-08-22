class Activity < ApplicationRecord
  belongs_to :daily_schedule
  validates :name, :start_time, :end_time, :presence => true
end
