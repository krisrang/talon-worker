$stdout.sync = true
require 'elastic_apm'
require 'talon_worker/api'

if ENV.fetch("RACK_ENV", "development") == "production"
  Raven.configure do |config|
    config.dsn = ENV["RAVEN_DSN"]
  end
end

use ElasticAPM::Middleware
use Raven::Rack

ElasticAPM.start(app: TalonWorkerAPI)

run TalonWorkerAPI

at_exit { ElasticAPM.stop }
