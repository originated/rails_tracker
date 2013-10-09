require_dependency "tracker/application_controller"
require 'faraday-http-cache'
require 'delayed_job_active_record'

module Tracker
  class IssuesController < ApplicationController
    before_filter :authenticate_user!, :only => [:track_issue, :currently_tracking]

    def index
      # Instantiate/setup the main applications Github config settings
      # Cache response headers for rate limiting / conditional check
      @store  = ActiveSupport::Cache::MemoryStore.new

      @github = Github::Issues.new do |config|
        config.stack.insert_before Github::Response::Jsonize, Faraday::HttpCache, @store
      end

      @issues = @github.all(:user => Tracker.config.user,
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
      # Instantiate/setup the main applications Github config settings
      # Cache response headers for rate limiting / conditional check
      @store  = ActiveSupport::Cache::MemoryStore.new

      @github = Github::Issues.new do |config|
        config.stack.insert_before Github::Response::Jsonize, Faraday::HttpCache, @store
      end

      @issues = @github.all(:user => Tracker.config.user,
                                  :repo => Tracker.config.repo,
                                  :state => "closed",
                                  :labels => Tracker.config.labels)
    end

    def listen
      # responder for post updates from github. Logic below is to handle callbacks from Github.
      if params["issue"].present? && params["issue"]["state"] == "closed"
        issue_id = params["issue"]["id"]
        # Local all users tracking the issue
        issues = UsersIssues.where(:issue_id => issue_id)
        issues.each do |issue|
          usr = User.find(issue.user_id)
          # Handle the mailer async & delay the job
          IssueMailer.delay.resolved_alert(usr,issue)
          # Mark the issue as closed
          issue.active = false
          issue.save
        end
      end
      render :nothing => true
    end

  end
end
