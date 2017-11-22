if Rails.env.production?
  Raven.configure do |config|
    config.dsn = ENV["RAVEN_DSN"]
    config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)
  end
end

