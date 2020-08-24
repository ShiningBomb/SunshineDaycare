class DailySchedule < ApplicationRecord
  belongs_to :weekly_schedule
  has_many :activities
  
  validates :date, :presence => true
end
