class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string :name
      t.integer :location
      t.integer :category
      t.datetime :start_time
      t.datetime :end_time
      t.references :daily_schedule, foreign_key: true

      t.timestamps
    end
  end
end
