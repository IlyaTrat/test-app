class AddDefaultValues < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :admin, false
    change_column_default :projects, :summary, ""
    change_column_default :tasks, :description, ""
    change_column_default :tasks, :status, "new"
  end
end
