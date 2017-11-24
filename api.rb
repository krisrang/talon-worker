class TalonWorkerAPI < Sinatra::Application
  configure :production do
    require 'skylight/sinatra'
    Skylight.start!
  end

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'bye'
  end

  get '/status' do
    content_type :json

    version = `youtube-dl --version`.strip
    { version: version }.to_json
  end

  post '/upgrade' do
    content_type :json

    out = `youtube-dl --update`.strip
    { out: out }.to_json
  end

  post '/info' do
    content_type :json
    
    url = request["url"]
    `youtube-dl -j #{url}`.strip
  end
end
