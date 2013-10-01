require_dependency "tracker/application_controller"

module Tracker
  class IssuesController < ApplicationController
    before_filter :authenticate_user!, :only => [:track_issue, :currently_tracking]

    def index
      # Instantiate/setup the main applications Github config settings
      # Here we display only active issues
      github  = Github.new
      @issues = github.issues.all(:user => Tracker.config.user,
                                  :repo => Tracker.config.repo,
                                  :labels => Tracker.config.labels)
    end

    def track_issue
      issue_id    = params[:id]
      issue_title = params[:title]
      issue_body  = params[:body]
      # Find or create a record for a user who indicates they want to track an issue
      UsersIssues.find_or_create_by_user_id_and_issue_id(:user_id => current_user.id,
                                                         :issue_id => issue_id,
                                                         :title => issue_title,
                                                         :body => issue_body)
      redirect_to :back
    end

    def un_track
      # Update corresponding record and change status for the particular issue
      @issue = UsersIssues.where(:user_id => current_user.id, :issue_id => params[:id])
      @issue[0].delete
      redirect_to :back
    end

    def currently_tracking
      @currently_tracked = UsersIssues.where(:user_id => current_user.id)
    end

    def resolved
      # Disply issues which are currently
      github  = Github.new
      @issues = github.issues.all(:user => Tracker.config.user,
                                  :repo => Tracker.config.repo,
                                  :state => "closed",
                                  :labels => Tracker.config.labels)
    end

  end
end
