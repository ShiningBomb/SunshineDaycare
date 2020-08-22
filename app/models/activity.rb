class Activity < ApplicationRecord
  belongs_to :daily_schedule
  validates :name, :start_time, :end_time, :presence => true
  validates :end_time, after_date: :start_time
end
