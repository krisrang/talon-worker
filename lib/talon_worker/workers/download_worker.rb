require 'shell_helpers'

class DownloadWorker
  include Sidekiq::Worker
  include ShellHelpers
  
	def perform(id, url, options={})
    info = JSON.parse(run("youtube-dl -j #{url}").strip)
	end
end
