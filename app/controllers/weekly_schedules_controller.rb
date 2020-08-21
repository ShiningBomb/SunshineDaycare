class WeeklySchedulesController < ApplicationController
  def index
    @weekly_schedules = WeeklySchedule.order(:start_date).all
  end

  def create
    @weekly_schedule = WeeklySchedule.new()

    if @weekly_schedule.save
      redirect_to weekly_schedules_path
    end
  end

  def edit
    @weekly_schedule = WeeklySchedule.find(params[:id])
  end
end
