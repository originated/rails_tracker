module Tracker
  class Engine < ::Rails::Engine
    require "github_api"

    isolate_namespace Tracker
  end

  def self.config(&block)
    yield Engine.config if block
    Engine.config
  end
end
