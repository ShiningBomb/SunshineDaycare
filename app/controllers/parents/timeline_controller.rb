class Parents::TimelineController < ParentsController
  def index
    @posts = current_parent.timeline.posts.order("created_at DESC")
  end

  def save
    @post = current_parent.timeline.posts.find(params[:timeline_id])
    @favorite_post = current_parent.favorite_posts.find(params[:timeline_id]) rescue nil
    if @favorite_post
      current_parent.favorite_posts.delete(@favorite_post)
      redirect_to parents_timeline_index_path, notice: "Post removed from favorites."
    else
      current_parent.favorite_posts << @post
      redirect_to parents_timeline_index_path, notice: "Post saved to favorites."
    end
  end
end
