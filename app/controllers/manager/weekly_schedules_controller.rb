class Manager::WeeklySchedulesController < ManagerController
  def index
    @program = Program.find(params[:program_id])
    @weekly_schedules = @program.weekly_schedules.order(:start_date).all
  end

  def create
    @program = Program.find(params[:program_id])
    @weekly_schedule = @program.weekly_schedules.new()

    if @weekly_schedule.save
      redirect_to manager_program_weekly_schedules_path(@program)
    end
  end

  def publish
    @program = Program.find(params[:program_id])
    @weekly_schedule = @program.weekly_schedules.find(params[:weekly_schedule_id])
    @weekly_schedule.publish()
    redirect_to manager_program_weekly_schedules_path(@program)
  end
end
