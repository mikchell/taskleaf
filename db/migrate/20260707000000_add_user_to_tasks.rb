class AddUserToTasks < ActiveRecord::Migration[8.1]
  def up
    execute "DELETE FROM tasks;"
    add_reference :tasks, :user, null: false, index: true unless column_exists?(:tasks, :user_id)
  end

  def down
    remove_reference :tasks, :user, index: true if column_exists?(:tasks, :user_id)
  end
end
