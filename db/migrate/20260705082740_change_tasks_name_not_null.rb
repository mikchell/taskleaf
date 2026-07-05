class ChangeTasksNameNotNull < ActiveRecord::Migration[8.1]
  def change
    change_column_null :tasks, :name, false
  end
end
