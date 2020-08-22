class Manager::ProgramsController < ManagerController
  def index
    @programs = Program.all
  end

  def new
    @program = Program.new
  end

  def create
    @program = Program.new(program_params)

    if @program.save
      redirect_to manager_programs_path
    else
      render 'new'
    end
  end

  def edit
    @program = Program.find(params[:id])
  end

  def update
    @program = Program.find(params[:id])
    if @program.update(program_params)
      redirect_to manager_programs_path
    else
      render 'edit'
    end
  end

  def show
    @program = Program.find(params[:id])
  end

  private

  def program_params
    params.require(:program).permit(:name, :from_age, :to_age)
  end
end
