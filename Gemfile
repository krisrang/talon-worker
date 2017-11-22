source 'https://rubygems.org'
ruby '2.4.2'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'
gem 'pg'
gem 'hiredis'
gem 'redis', require:  ["redis", "redis/connection/hiredis"]
gem 'redis-rails', '~> 5.0.0'
gem 'bootsnap', require: false

gem 'sidekiq'
gem 'message_bus'
gem 'sentry-raven'
gem 'fast_xor'
gem "skylight"

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails'
  gem 'bundle-audit'
end

group :test do
  # gem 'timecop'
  # gem 'mocha'
  # gem 'database_cleaner'
  # gem 'rails-controller-testing'
  # gem 'shoulda-matchers', github: 'thoughtbot/shoulda-matchers', branch: 'rails-5'
  gem 'rspec_junit_formatter'
  # gem 'fabrication'
end

group :development do
  gem 'web-console'
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'bullet'
end

gem 'puma'
