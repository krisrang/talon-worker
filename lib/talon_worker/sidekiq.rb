require 'sidekiq'
require 'raven'

if ENV.fetch("RACK_ENV", "development") == "production"
  Raven.configure do |config|
    config.dsn = ENV["RAVEN_DSN"]
  end
end

require_relative 'workers/download_worker'
