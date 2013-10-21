class AddRelationUsersIssues < ActiveRecord::Migration
  def change
    add_column :rails_tracker_users_issues, :user_id, :integer
  end
end
