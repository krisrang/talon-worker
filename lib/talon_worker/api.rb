require 'sinatra'
require 'sinatra/reloader'
require 'raven'
require 'shell_helpers'

class TalonWorkerAPI < Sinatra::Application  
  include ShellHelpers

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
    response = run("youtube-dl -j #{url}").strip

    if response.split("\n").last.start_with?('ERROR:')
      error = response.split("\n").last.sub('ERROR: ', '')
      return [400, { error: error }.to_json]
    end

    begin
      JSON.parse(response)
    rescue JSON::ParserError
      return [400, { error: 'Unknown error' }.to_json]
    end

    response
  end
end
