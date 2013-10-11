module Tracker
  class Engine < ::Rails::Engine
    require "github_api"

    isolate_namespace Tracker

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
    end
  end

  def self.config(&block)
    yield Engine.config if block
    Engine.config
  end
end
