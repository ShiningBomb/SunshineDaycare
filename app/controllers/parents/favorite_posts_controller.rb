class Parents::FavoritePostsController < ParentsController
    def index
        @posts = current_parent.favorite_posts
    end
end
