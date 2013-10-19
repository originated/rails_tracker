class CreateTrackerIssues < ActiveRecord::Migration
  def change
    create_table :active_progress_issues do |t|
      t.text :title
      t.text :content

      t.timestamps
    end
  end
end
