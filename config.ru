$stdout.sync = true
require 'talon_worker/api'

Raven.configure do |config|
  config.dsn = ENV["RAVEN_DSN"]
end

use Raven::Rack
run TalonWorkerAPI
