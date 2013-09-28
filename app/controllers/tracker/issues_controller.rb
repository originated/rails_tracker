require_dependency "tracker/application_controller"

module Tracker
  class IssuesController < ApplicationController
    before_filter :authenticate_user!, :only => :track_issue

    def index
      # Instantiate/setup the main applications Github config settings
      github = Github.new
      @issues = github.issues.list :user => Tracker.config.user, :repo => Tracker.config.repo
    end

    def track_issue
    end

    def un_track_issue
    end

  end
end
