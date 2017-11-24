class TalonWorkerAPI < Sinatra::Application
  # configure :production do
  #   require 'skylight/sinatra'
  #   Skylight.start!
  # end

  get '/' do  
    'bye'
  end

  get '/status' do
    version = `youtube-dl --version`.strip
    content_type :json
    { version: version }.to_json
  end
end
