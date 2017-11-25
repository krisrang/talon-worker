ENV['RACK_ENV'] = ENV['RAILS_ENV'] = ENV['ENV'] = 'test'

require 'rspec'
require 'rack/test'
require 'talon_worker/api'

module TestHelpers
  include Rack::Test::Methods

  def parsed_body
    MultiJson.decode(body)
  end
end

RSpec.configure do |c|
  c.mock_framework = :mocha
  c.expect_with :rspec
  c.include TestHelpers

  c.before :suite do
  end

  c.before :each do
  end

  c.after :each do
  end
end
