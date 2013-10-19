module ActiveProgress
  class ApplicationController < ActionController::Base

    def redirect_to_back_if_valid
      if request.env["HTTP_REFERER"].blank?
        redirect_to :root
      else
        redirect_to :back
      end
    end
  end
end
