class Caretakers::PostsController < CaretakersController
  def index
    @posts = current_caretaker.posts
  end

  def new
    @post = current_caretaker.posts.new
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
    params.require(:post).permit(:description, :picture)
  end
end
