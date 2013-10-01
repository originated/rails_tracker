# Use this setup block to configure your GitHub account
Tracker.config do |c|
  # If the repo is public facing the password is not required.  It is recommended to store confidential
  # information like your password in ENV settings. By default only issues with the label public
  # will be displayed.
  c.user   = 'mcifani'
  c.pass   = 'github_password'
  c.repo   = 'active_progress'
  c.labels = 'public'
end

