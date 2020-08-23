class CreateChildrenPosts < ActiveRecord::Migration[5.1]
  def change
    create_join_table :children, :posts do |t|
      t.index [:child_id, :post_id]
    end
  end
end
