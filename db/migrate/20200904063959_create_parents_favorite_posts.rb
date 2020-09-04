class CreateParentsFavoritePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :parents_favorite_posts, id: false  do |t|
      t.belongs_to :parent
      t.belongs_to :post
    end
  end
end
