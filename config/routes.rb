Tracker::Engine.routes.draw do

  root :to => "issues#index"

  post "track_issue/:id" => "issues#track_issue", :as => :track_issue
  post "un_track/:id" => "issues#un_track", :as => :un_track
  get "saved" => "issues#currently_tracking", :as => :saved
  get "resolved" => "issues#resolved", :as => :resolved

  # Payload from Github web hook
  get "status/change/:payload" => "issues#status_change"

  # Listener for payload from Github
  post "listen" => 'issues#listen'

end
