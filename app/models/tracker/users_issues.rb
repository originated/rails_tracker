module Tracker
  class UsersIssues < ActiveRecord::Base
    attr_accessible :active, :assignee, :body, :id, :title, :user_id, :issue_id

    validates_presence_of :user_id, :title
  end
end
