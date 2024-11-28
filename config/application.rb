# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'
Bundler.require(*Rails.groups)

module Babbler
  class Application < Rails::Application
    config.load_defaults 7.1
    config.autoload_lib(ignore: %w[assets tasks])

    config.generators do |g|
      g.helper false
      g.view_specs false
      g.helper_specs false
      g.routing_specs false
      g.system_tests nil
    end
    config.active_job.queue_adapter = :sidekiq
  end
end
