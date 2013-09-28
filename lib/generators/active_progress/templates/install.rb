# Use this setup block to configure your GitHub account
Tracker.config do |c|
  # If the repo is public facing the password is not required.  It is recommended to store confidential
  # information like your password in system ENV variables.
  c.user = 'github_username'
  c.pass = 'github_password'
  c.repo = 'github_repo'
end