class Parents::WeeklySchedulesController < ParentsController
  def index
    @child = current_parent.children.find(params[:child_id])
    @program = @child.program
    @weekly_schedules = @program.weekly_schedules.where('start_date > ?', DateTime.now - 7.days).order(:start_date)
  end
end
