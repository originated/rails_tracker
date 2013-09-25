Tracker::Engine.routes.draw do

  root :to => "issues#index"

  get "track_issue/:id" => "issues#track_issue"

end
