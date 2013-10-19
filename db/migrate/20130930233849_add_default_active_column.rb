class AddDefaultActiveColumn < ActiveRecord::Migration
  def change
    change_column :active_progress_users_issues, :active, :boolean, :default => true
  end

end
