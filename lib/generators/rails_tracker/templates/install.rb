# Use this setup block to configure your GitHub account
RailsTracker.config do |c|
  # If the repo is public facing the password is not required.  It is recommended to store confidential
  # information like your password in ENV settings.
  c.user   = 'mcifani'
  c.pass   = 'github_password'
  c.repo   = 'rails_tracker'

  # Only issues that include the following tag will be shown to your users
  c.labels = 'public'

  # Change the default title on the web UI
  c.title  = 'Rails Tracker'
end

