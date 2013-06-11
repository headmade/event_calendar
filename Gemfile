source 'https://rubygems.org'

gem 'rails', '3.2.13'

gem 'pg'

gem 'haml-rails'
gem 'compass-rails'
gem 'configus', :git => 'git://github.com/relev/configus.git'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :development do
    gem "better_errors"
    gem "binding_of_caller"
    gem 'yard'
end

group :test, :development do
    gem 'simplecov', :require => false
    gem 'simplecov-rcov', :require => false
    gem 'pry-rails'
    gem "rspec-rails", "~> 2.0"
    gem "factory_girl_rails"
    gem "guard"
    gem "guard-rspec"
    gem "guard-spork"
    gem "mocha", :require => false
    gem 'rb-fsevent', :require => false
    gem "capybara" , "~> 2.0.0"
    gem 'database_cleaner'
    gem 'rb-inotify', '~> 0.9', :require => false
    gem 'mock_redis'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano'
gem 'capistrano_colors'
gem 'rvm-capistrano'

# To use debugger
# gem 'debugger'
