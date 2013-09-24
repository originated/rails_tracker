require_dependency "tracker/application_controller"

module Tracker
  class IssuesController < ApplicationController

    def index
      @issues = Issue.all
    end

    def track_issue

    end

    def un_track_issue

    end

  end
end
