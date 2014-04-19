ruby "2.0.0"

source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.0'

# Use mysql as the database for Active Record
gem 'mysql2'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails', '3.0.4'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use puma as the app server
gem "puma"

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

gem "kaminari"

gem "foreman"

group :test, :development do
  gem "rb-fsevent"
  gem "factory_girl_rails"
  gem "capybara"
  gem "guard-rspec"
  gem "terminal-notifier-guard"
  gem "rspec-rails"
  gem "pry-rails"
end

group :development do
  gem "rack-mini-profiler"
  gem "bullet"
  gem "better_errors"
  gem "binding_of_caller"
  gem "meta_request"
  gem "newrelic_rpm"
end

group :test do
end

group :production do
  gem "rails_12factor"
end

# ember
gem "ember-rails", "0.14.1"
gem "ember-source", "1.5.0"

# sorcery
gem "sorcery"

# annotate models
gem "annotate", :git => "git://github.com/ctran/annotate_models.git"

# id_ecuador
gem "id_ecuador", ">= 0.0.2.alpha"

# ActionController caching
gem "actionpack-action_caching", github: "rails/actionpack-action_caching"

# backgrounding:
gem "sidekiq", "~> 2.17.4"
gem "sinatra", require: false
gem "slim"

# rest-client
gem "rest-client"

# pusher-client
gem "pusher-client"

# cron tasks
gem "whenever", :require => false

# uploads
gem "carrierwave"

# highcharts
gem "highcharts-rails", "~> 3.0.0"

gem "dotenv-rails"

gem "money-rails"

gem "sentry-raven", github: "getsentry/raven-ruby"
