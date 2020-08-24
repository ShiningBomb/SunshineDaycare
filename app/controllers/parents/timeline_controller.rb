class Parents::TimelineController < ParentsController
  def index
    @posts = current_parent.timeline.posts
  end

  def save
  end
end
