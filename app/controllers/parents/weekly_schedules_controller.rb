class Parents::WeeklySchedulesController < ParentsController
  def index
    @child = current_parent.children.find(params[:child_id])
    @program = @child.program
    @weekly_schedules = @program.weekly_schedules.order(:start_date)
  end
end
