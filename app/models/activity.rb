class Activity < ApplicationRecord
  belongs_to :daily_schedule
  validates :name, :start_time, :end_time, :presence => true
  validates :end_time, after_date: :start_time

  enum location: ['Room A', 'Room B', 'Room C', 'Library', 'Playground', 'Garden', 'West Garden']
  enum category: ['Meal', 'Cooking', 'Outdoor', 'Reading', 'English', 'Lecture']
end
