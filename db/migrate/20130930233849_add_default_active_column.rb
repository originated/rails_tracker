class AddDefaultActiveColumn < ActiveRecord::Migration
  def change
    change_column :tracker_users_issues, :active, :boolean, :default => true
  end

end
