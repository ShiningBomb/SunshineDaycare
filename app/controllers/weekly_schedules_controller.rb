class WeeklySchedulesController < ApplicationController
  def index
    @weekly_schedules = WeeklySchedule.all
  end

  def create
    @weekly_schedule = WeeklySchedule.new()
    @weekly_schedule.start_date = Date.today.beginning_of_week

    last_week = WeeklySchedule.order("start_date").last
    if last_week
      @weekly_schedule.start_date = last_week.start_date + 7.days
    end

    if @weekly_schedule.save
      redirect_to weekly_schedules_path
    end
  end
end
