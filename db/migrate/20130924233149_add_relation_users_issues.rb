class AddRelationUsersIssues < ActiveRecord::Migration
  def change
    add_column :tracker_users_issues, :user_id, :integer
  end
end
