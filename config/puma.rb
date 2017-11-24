threads_count = Integer(ENV.fetch("PUMA_MAX_THREADS") { 5 })
threads threads_count, threads_count
port Integer(ENV.fetch("PORT") { 5000 })
environment ENV.fetch("RACK_ENV") { "development" }
workers Integer(ENV.fetch("WEB_CONCURRENCY") { 2 })
preload_app!

# before_fork do
#   ActiveRecord::Base.connection_pool.disconnect! if defined?(ActiveRecord)
# end
