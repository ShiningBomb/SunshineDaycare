class AddProgramToChildren < ActiveRecord::Migration[5.1]
  def change
    add_reference :children, :program, foreign_key: true
  end
end
