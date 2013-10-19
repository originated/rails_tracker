class AddIssueIdIssues < ActiveRecord::Migration
  def change
    add_column :active_progress_users_issues, :issue_id, :integer
  end
end
