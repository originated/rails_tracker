module Tracker
  class IssueMailer < ActionMailer::Base
    default from: "from@example.com"

    def resolved_alert(user)
      @user = user
      mail(:to => @user.email, :subject => "An issue you've been tracking has been resolved")
    end

  end
end
