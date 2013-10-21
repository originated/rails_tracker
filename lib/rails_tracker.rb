require "rails_tracker/engine"

module RailsTracker

   def tracking?(user,issue)
     # Lookup to see if user is tracking the particular issue
     user = User.find(user)
     results = UsersIssues.where(:user_id => user.id, :issue_id => issue)
     if results[0].present?
       true
     else
       false
     end
   end

end
