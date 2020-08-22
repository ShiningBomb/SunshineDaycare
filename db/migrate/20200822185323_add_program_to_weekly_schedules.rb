class AddProgramToWeeklySchedules < ActiveRecord::Migration[5.1]
  def change
    add_reference :weekly_schedules, :program, foreign_key: true
  end
end
