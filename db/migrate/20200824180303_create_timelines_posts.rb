class CreateTimelinesPosts < ActiveRecord::Migration[5.1]
  def change
    create_join_table :timelines, :posts do |t|
      t.index [:timeline_id, :post_id]
    end
  end
end
