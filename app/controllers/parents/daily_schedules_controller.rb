class Parents::DailySchedulesController < ParentsController
  def show
    @child = current_parent.children.find(params[:child_id])
    @program = @child.program
    @weekly_schedule = @program.weekly_schedules.find(params[:weekly_schedule_id])
    @daily_schedule = @weekly_schedule.daily_schedules.find(params[:id])
  end
end
