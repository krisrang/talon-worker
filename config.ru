require 'rubygems'
require 'bundler'
Bundler.require

Raven.configure do |config|
  config.dsn = ENV["RAVEN_DSN"]
end

use Raven::Rack

require './api'
run TalonWorkerAPI
