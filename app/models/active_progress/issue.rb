module ActiveProgress
  class Issue < ActiveRecord::Base
    attr_accessible :content, :title

    validates_presence_of :title, :content
  end
end
