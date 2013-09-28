class AddIssueIdIssues < ActiveRecord::Migration
  def change
    add_column :tracker_users_issues, :issue_id, :integer
  end
end
