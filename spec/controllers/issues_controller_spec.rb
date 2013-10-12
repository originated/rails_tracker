require 'spec_helper'
require 'debugger'

describe Tracker::IssuesController do

  before(:each) do
    Tracker.config.user   = "mcifani"
    Tracker.config.repo   = "active_progress"
    Tracker.config.labels = "public"
  end

  describe "GET 'index'" do

    it "should be successful" do
      Tracker.config.state = "open"
      get 'index', use_route: :root
      response.should be_success
    end
  end

  describe "GET 'resolved'" do

    it "should be success on current issues marked with closed state" do
      Tracker.config.state = "closed"
      get 'resolved', use_route: :resolved
      response.should be_success
    end
  end

  describe "GET 'un_track'" do

    it "should not locate a user issue if none exist" do
      controller.stub_chain(:current_user,:id)
      get 'un_track', use_route: :un_track
      assigns(:issue).should be_empty
    end
  end

end
