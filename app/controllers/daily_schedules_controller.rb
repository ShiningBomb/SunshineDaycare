class DailySchedulesController < ApplicationController
  def edit
    @daily_schedule = DailySchedule.find(params[:id])
    @weekly_schedule = @daily_schedule.weekly_schedule
  end
end
