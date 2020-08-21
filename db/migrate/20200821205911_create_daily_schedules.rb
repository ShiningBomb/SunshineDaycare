class CreateDailySchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :daily_schedules do |t|
      t.datetime :date
      t.references :weekly_schedule, foreign_key: true

      t.timestamps
    end
  end
end
