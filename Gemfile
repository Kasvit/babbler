# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.2.2'
gem 'jbuilder'
gem 'pg', '~> 1.1'
gem 'puma', '>= 5.0'
gem 'rails', '~> 7.1.4'
gem 'redis'
gem 'sassc-rails'
gem 'sidekiq'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"
gem 'bootsnap', require: false
gem 'devise'
gem 'heroicon'
gem 'kamal'
gem 'rubocop', require: false
gem 'slim'
gem 'tzinfo-data', platforms: %i[windows jruby]
gem 'view_component'

group :development, :test do
  gem 'brakeman', require: false
  gem 'debug', platforms: [:mri]
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry'
  # Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
  gem 'dotenv'
  gem 'rubocop-rails-omakase', require: false
end

group :development do
  gem 'annotate'
  gem 'rspec-rails'
  gem 'web-console'
  gem "better_errors"
  gem "binding_of_caller"
end

group :test do
  gem 'capybara'
  gem 'database_cleaner-active_record'
  gem 'database_cleaner-redis'
  gem 'rails-controller-testing'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers', '~> 6.0'
  gem 'simplecov', require: false
end
