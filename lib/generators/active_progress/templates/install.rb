# Use this setup block to configure your GitHub account
Tracker.config do |c|
  # If the repo is public facing the password is not required.  It is recommended to store confidential
  # information like your password in ENV settings.
  c.user   = 'mcifani'
  c.pass   = 'github_password'
  c.repo   = 'active_progress'

  # Only issues that include the following tag will be shown to your users
  c.labels = 'public'

  # Change the default title on the web UI
  c.title  = 'Active Progress'
end

