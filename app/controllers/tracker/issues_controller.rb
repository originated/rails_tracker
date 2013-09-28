require_dependency "tracker/application_controller"

module Tracker
  class IssuesController < ApplicationController
    before_filter :authenticate_user!, :only => :track_issue

    def index
      # Instantiate/setup the main applications Github config settings
      github  = Github.new
      @issues = github.issues.list :user => Tracker.config.user, :repo => Tracker.config.repo
    end

    def track_issue
      issue_id    = params[:id]
      issue_title = params[:title]
      issue_body  = params[:body]
      # Find or create a record for a user who indicates they want to track an issue
      UsersIssues.find_or_create_by_user_id_and_issue_id(:user_id => current_user.id, :issue_id => issue_id,
      :title => issue_title, :body => issue_body)
      redirect_to :back
    end

    def un_track
    end

  end
end
