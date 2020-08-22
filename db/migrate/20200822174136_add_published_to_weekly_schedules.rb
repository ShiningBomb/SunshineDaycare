class AddPublishedToWeeklySchedules < ActiveRecord::Migration[5.1]
  def change
    add_column :weekly_schedules, :is_published, :boolean
    add_column :weekly_schedules, :published_at, :datetime
  end
end
