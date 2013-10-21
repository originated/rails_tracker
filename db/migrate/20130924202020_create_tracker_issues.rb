class CreateTrackerIssues < ActiveRecord::Migration
  def change
    create_table :rails_tracker_issues do |t|
      t.text :title
      t.text :content

      t.timestamps
    end
  end
end
