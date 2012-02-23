Lopr::Application.configure do
  config.middleware.insert_before(Rack::Lock, Rack::LiveReload)
end if Rails.env.development?