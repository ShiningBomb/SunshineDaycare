class Activity < ApplicationRecord
  belongs_to :daily_schedule
  validates :name, :start_time, :end_time, :location, :category, :presence => true
  validates :end_time, after_date: :start_time

  enum location: ['Room A', 'Room B', 'Room C', 'Library', 'Playground', 'Garden', 'West Garden', 'Outbound']
  enum category: ['Meal', 'Cooking', 'Social', 'Outdoor', 'Reading', 'English', 'Lecture']
end
