require 'spec_helper'
require 'debugger'

describe RailsTracker::IssuesController do

  before(:each) do
    RailsTracker.config.user   = "mcifani"
    RailsTracker.config.repo   = "active_progress"
    RailsTracker.config.labels = "public"
  end

  describe "GET 'index'" do

    it "should be successful" do
      RailsTracker.config.state = "open"
      get 'index', use_route: :root
      response.should be_success
    end
  end

  describe "GET 'resolved'" do

    it "should be success on current issues marked with closed state" do
      RailsTracker.config.state = "closed"
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

  describe "GET 'current_tracking'" do

    it "should be success" do
      controller.stub(:authenticate_user!)
      controller.stub_chain(:current_user,:id)
      get 'currently_tracking', use_route: :saved
      response.should be_success
    end

    it "should not locate any currently tracked issues without existing user" do
      controller.stub(:authenticate_user!)
      controller.stub_chain(:current_user,:id)
      get 'currently_tracking', use_route: :saved
      assigns(:currently_tracked).should be_empty
    end
  end

end
