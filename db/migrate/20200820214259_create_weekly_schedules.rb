class CreateWeeklySchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :weekly_schedules do |t|
      t.datetime :start_date

      t.timestamps
    end
  end
end
