describe DownloadWorker do
  it "fetches video info" do
    testurl = "https://www.youtube.com/watch?v=urk_kp76RoI"
    worker = DownloadWorker.new

    worker.expects(:run).with("youtube-dl -j #{testurl}").returns("{}")
    worker.perform(1, testurl, {})
  end
end
