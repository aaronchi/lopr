source 'https://rubygems.org'

gem 'rails', '3.2.3'
gem 'mysql2'
gem 'settingslogic'

# Utility
gem 'airbrake'
#gem 'aweber'
gem 'mechanize'

# Authentication
gem 'devise'

## Models
gem 'acts_as_list'
gem 'attribute_normalizer'
gem 'friendly_id'
gem 'kaminari'
gem 'sanitize'
gem 'validate_url'

## Controllers
gem 'inherited_resources'
gem 'sentient_user'

## Views
gem 'simple_form', '~> 2.0.0.rc'
gem 'tabs_on_rails'

## Uploads
gem 'carrierwave'
  gem 'rmagick', :require => 'RMagick'
  gem 'fog', '>= 1.1.2'
  
## Asset Pipeline
gem 'jquery-rails'
gem 'tinymce-rails'

## Assets
group :assets do
  gem 'compass-rails'
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :production do
  gem 'thin'
end

group :development do
  gem 'heroku'
    gem 'heroku_san'
    gem 'taps'
  gem 'mailcatcher'
  gem 'powder'
  gem 'rack-livereload'
end

group :development, :test do
  #gem 'ruby-debug19', :require => 'ruby-debug'
  gem 'rspec-rails'
end

# Factories
gem 'factory_girl_rails'
gem 'ffaker'
gem 'forgery'

group :test do
  
  # Testing Tools
  gem 'capybara'
  gem 'spork', '~> 1.0rc'
  #gem 'shoulda-context'
  #gem 'shoulda-matchers'

  # Guard
  gem 'guard-bundler'
  gem 'guard-livereload'
  gem 'guard-pow'
  gem 'guard-sass'
  gem 'guard-spork'
  gem 'guard-rspec'
  
  # Notifications
  gem 'ruby_gntp'
    
end
