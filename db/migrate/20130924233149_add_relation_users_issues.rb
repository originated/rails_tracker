class AddRelationUsersIssues < ActiveRecord::Migration
  def change
    add_column :active_progress_users_issues, :user_id, :integer
  end
end
