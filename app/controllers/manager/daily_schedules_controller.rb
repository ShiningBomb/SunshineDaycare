class Manager::DailySchedulesController < ManagerController
  def edit
    @program = Program.find(params[:program_id])
    @daily_schedule = DailySchedule.find(params[:id])
    @weekly_schedule = @daily_schedule.weekly_schedule
  end
end
