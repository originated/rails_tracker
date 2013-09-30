Tracker::Engine.routes.draw do

  root :to => "issues#index"

  post "track_issue/:id" => "issues#track_issue", :as => :track_issue
  post "un_track/:id" => "issues#un_track", :as => :un_track
  get "currently_tracking" => "issues#currently_tracking", :as => :currently_tracking
  get "resolved"  => "issues#resolved", :as => :resolved_issues

end
