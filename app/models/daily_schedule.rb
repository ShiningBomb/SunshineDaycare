class DailySchedule < ApplicationRecord
  belongs_to :weekly_schedule
  validates :date, :presence => true
  has_many :activities
end
