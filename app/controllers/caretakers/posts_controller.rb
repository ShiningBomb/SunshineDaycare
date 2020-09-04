class Caretakers::PostsController < CaretakersController
  def index
    @posts = current_caretaker.posts.order("created_at DESC")
  end

  def new
    @post = current_caretaker.posts.new

    if params[:date].present?
      date = params[:date].to_date()
      @activities = current_caretaker.activities.joins(:daily_schedule).where('daily_schedules.date' => date.beginning_of_day..date.end_of_day)
    end
    if params[:activity].present?
      activity = current_caretaker.activities.find(params[:activity])
      @children = activity.daily_schedule.weekly_schedule.program.children
    end

    if request.xhr?
      respond_to do |format|
        format.json {
          render json: {activities: @activities, children: @children}
        }
      end
    end
  end

  def create
    @post = current_caretaker.posts.new(post_params)

    if @post.save
        redirect_to caretakers_posts_path
      else
        render 'new'
      end
  end

  def edit
    @post = current_caretaker.posts.find(params[:id])
  end

  def update
    @post = current_caretaker.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to caretakers_posts_path
    else
      render 'edit'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :picture, :activity_id, :child_ids => [])
  end
end
