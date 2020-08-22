class Manager::ActivitiesController < ManagerController 
  def new
    @program = Program.find(params[:program_id])
    @weekly_schedule = @program.weekly_schedules.find(params[:weekly_schedule_id])
    @daily_schedule = DailySchedule.find(params[:daily_schedule_id])
    @activity = @daily_schedule.activities.new(:start_time=>@daily_schedule.date, :end_time=>@daily_schedule.date)
  end

  def create
    @program = Program.find(params[:program_id])
    @weekly_schedule = @program.weekly_schedules.find(params[:weekly_schedule_id])
    @daily_schedule = DailySchedule.find(params[:daily_schedule_id])
    @activity = @daily_schedule.activities.new(activity_params)

    if @activity.save
      redirect_to edit_manager_program_weekly_schedule_daily_schedule_path(@program, @daily_schedule.weekly_schedule, @daily_schedule)
    else
      render 'new'
    end
  end

  def edit
    @program = Program.find(params[:program_id])
    @weekly_schedule = @program.weekly_schedules.find(params[:weekly_schedule_id])
    @daily_schedule = DailySchedule.find(params[:daily_schedule_id])
    @activity = Activity.find(params[:id])
  end

  def update
    @program = Program.find(params[:program_id])
    @weekly_schedule = @program.weekly_schedules.find(params[:weekly_schedule_id])
    @daily_schedule = DailySchedule.find(params[:daily_schedule_id])
    @activity = Activity.find(params[:id])

    if @activity.update(activity_params)
      redirect_to edit_manager_program_weekly_schedule_daily_schedule_path(@program, @daily_schedule.weekly_schedule, @daily_schedule)
    else
      render 'edit'
    end
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :location, :category, :start_time, :end_time)
  end
end
