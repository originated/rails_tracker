module RailsTracker
  class IssueMailer < ActionMailer::Base
    default from: "from@example.com"

    def resolved_alert(user,issue)
      @user  = user
      @issue = issue
      mail(:to => @user.email, :subject => "An issue you've been tracking has been resolved")
    end

  end
end
