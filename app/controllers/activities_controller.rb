class ActivitiesController < ApplicationController
  def new
    @weekly_schedule = WeeklySchedule.find(params[:weekly_schedule_id])
    @daily_schedule = DailySchedule.find(params[:daily_schedule_id])
    @activity = @daily_schedule.activities.new(:start_time=>@daily_schedule.date, :end_time=>@daily_schedule.date)
  end

  def create
    @weekly_schedule = WeeklySchedule.find(params[:weekly_schedule_id])
    @daily_schedule = DailySchedule.find(params[:daily_schedule_id])
    @activity = @daily_schedule.activities.new(activity_params)

    if @activity.save
      redirect_to edit_weekly_schedule_daily_schedule_path(@daily_schedule.weekly_schedule, @daily_schedule)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :location, :category, :start_time, :end_time)
  end
end
