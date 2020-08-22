class WeeklySchedule < ApplicationRecord
  belongs_to :program
  has_many :daily_schedules
  
  validates :start_date, :presence => true

  before_validation :init_start_date
  after_create :init_daily_schedules
  
  def publish
    self.update(:is_published => true, :published_at => DateTime.now)
  end

  private

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
