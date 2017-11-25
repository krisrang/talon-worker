require 'sinatra'
require 'sinatra/reloader'
require 'raven'
require 'shell_helpers'

class TalonWorkerAPI < Sinatra::Application
  include ShellHelpers

  # configure :production do
  #   require 'skylight/sinatra'
  #   Skylight.start!
  # end

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'bye'
  end

  get '/status' do
    content_type :json

    region = ENV.fetch("REGION")
    version = run("youtube-dl --version").strip
    { version: version, region: region }.to_json
  end

  post '/upgrade' do
    content_type :json

    out = run("youtube-dl --update").strip
    { out: out }.to_json
  end

  post '/info' do
    content_type :json
    
    url = request["url"]
    run("youtube-dl -j #{url}").strip
  end
end
