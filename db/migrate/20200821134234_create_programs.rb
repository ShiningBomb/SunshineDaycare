class CreatePrograms < ActiveRecord::Migration[5.1]
  def change
    create_table :programs do |t|
      t.string :name
      t.integer :from_age
      t.integer :to_age

      t.timestamps
    end
  end
end
