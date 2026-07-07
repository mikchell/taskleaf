class AddAdminToUsers < ActiveRecord::Migration[8.1]
  def up
    execute "DELETE FROM tasks;"
    add_column :users, :admin, :boolean, null: false, default: false
    add_reference :tasks, :user, null: false, index: true
  end

  def down
    remove_reference :tasks, :user, index: true
    remove_column :users, :admin
  end
end
