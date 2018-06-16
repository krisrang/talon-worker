describe 'API' do
  def app
    TalonWorkerAPI
  end
  
  describe "/" do
    it "says bye" do
      get '/'
      expect(last_response).to be_ok
      expect(last_response.body).to eq('bye')
    end
  end

  describe "/status" do
    it "queries youtube-dl and shows version" do
      TalonWorkerAPI.any_instance.expects(:run).with("youtube-dl --version").returns("test")

      get '/status'
      expect(last_response).to be_ok

      result = JSON.parse(last_response.body)
      expect(result["version"]).to eq("test")
      expect(result["region"]).to eq("EU")
    end
  end

  describe "/upgrade" do
    it "upgrades youtube-dl" do
      TalonWorkerAPI.any_instance.expects(:run).with("youtube-dl --update").returns("done")

      post '/upgrade'
      expect(last_response).to be_ok

      result = JSON.parse(last_response.body)
      expect(result["out"]).to eq("done")
    end
  end

  describe "/info" do
    it "queries info youtube-dl for video info" do
      url = "testurl"
      TalonWorkerAPI.any_instance.expects(:run).with("youtube-dl -j #{url}").returns('{"info": "info"}')

      post '/info', url: url
      expect(last_response).to be_ok
      expect(last_response.body).to eq('{"info": "info"}')
    end

    it "returns error when youtube-dl errors" do
      url = "testurl"
      TalonWorkerAPI.any_instance.expects(:run).with("youtube-dl -j #{url}").returns("some warning\nERROR: Some error")

      post '/info', url: url
      expect(last_response).to be_bad_request
      expect(last_response.body).to eq('{"error":"Some error"}')
    end

    it "returns error when youtube-dl response can't be parsed" do
      url = "testurl"
      TalonWorkerAPI.any_instance.expects(:run).with("youtube-dl -j #{url}").returns("weird")

      post '/info', url: url
      expect(last_response).to be_bad_request
      expect(last_response.body).to eq('{"error":"Unknown error"}')
    end
  end
end
