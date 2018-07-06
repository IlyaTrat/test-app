class ChangeAllTables < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks, :project, foreign_key: true
    add_index :tasks, :title, unique: true
  end
end
