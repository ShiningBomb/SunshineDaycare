class WeeklySchedule < ApplicationRecord
  has_many :daily_schedules
  
  before_validation :init_start_date

  validates :start_date, :presence => true

  after_create :init_daily_schedules

  def init_start_date
    self.start_date = Date.today.beginning_of_week
    last_week = WeeklySchedule.order("start_date").last
    
    if last_week
      self.start_date = last_week.start_date + 7.days
    end 
  end

  def init_daily_schedules
    for i in 0..4
        daily_schedules.create(:date => start_date + i.days)
    end
  end
end
