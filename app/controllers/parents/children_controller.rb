class Parents::ChildrenController < ParentsController
  def index
    @children = current_parent.children.all
  end

  def new
    @child = current_parent.children.new
  end

  def create
    @child = current_parent.children.new(child_params)

    if @child.save
      redirect_to parents_children_path
    else
      render 'new'
    end
  end

  def edit
    @child = current_parent.children.find(params[:id])
  end

  def update
    @child = current_parent.children.find(params[:id])
    if @child.update(child_params)
      redirect_to parents_children_path
    else
      render 'edit'
    end
  end

  private

  def child_params
    params.require(:child).permit(:name, :age, :program_id)
  end
end
