require 'rubygems'
require 'bundler'
Bundler.require

Raven.configure do |config|
  config.dsn = ENV["RAVEN_DSN"]
end

require_relative 'workers/download_worker.rb'
