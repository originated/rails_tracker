Tracker::Engine.routes.draw do

  root :to => "issues#index"

  post "track_issue/:id" => "issues#track_issue", :as => :track_issue

end
