class ActivityTimeChangeColumnType < ActiveRecord::Migration[5.1]
  def change
    change_column :activities, :start_time, :time
    change_column :activities, :end_time, :time
  end
end
