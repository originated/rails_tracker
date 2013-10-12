require 'spec_helper'
require 'debugger'

describe Tracker::IssuesController do

  before(:each) do
    Tracker.config.user   = "mcifani"
    Tracker.config.repo   = "active_progress"
    Tracker.config.state  = "open"
    Tracker.config.labels = "public"
  end

  describe "GET 'index'" do
    it "should be successful" do
      get 'index', use_route: :root
      response.should be_success
    end
  end

end
