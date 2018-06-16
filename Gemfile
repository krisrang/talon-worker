source 'https://rubygems.org'
ruby '2.5.0'

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
gem 'elastic-apm', '~> 1.0.0.beta1'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'bundle-audit'
  gem 'rake'
end

group :test do
  gem 'rack-test'
  gem 'rspec'
  gem 'rspec_junit_formatter'
  gem 'mocha'
end

group :development do
  gem 'listen'
end

gem 'puma'
