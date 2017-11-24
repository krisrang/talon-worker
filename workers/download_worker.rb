class DownloadWorker
  include Sidekiq::Worker
  
	def perform
		'I am a worker'
	end
end
