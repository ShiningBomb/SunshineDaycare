class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :description
      t.references :caretaker, foreign_key: true
      t.attachment :picture

      t.timestamps
    end
  end
end
