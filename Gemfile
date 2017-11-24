source 'https://rubygems.org'
ruby '2.4.2'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'sinatra'
gem 'sinatra-contrib'
gem 'hiredis'
gem 'redis', require:  ["redis", "redis/connection/hiredis"]
gem 'bootsnap', require: false

gem 'sidekiq'
gem 'sentry-raven'
gem 'skylight'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'bundle-audit'
end

group :test do
  gem 'rspec_junit_formatter'
end

group :development do
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
end

gem 'puma'
