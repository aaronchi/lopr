Rails.application.config.middleware.use Rack::CanonicalHost do
  Settings.host
end