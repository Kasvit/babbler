# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.2.2'
gem 'importmap-rails'
gem 'jbuilder'
gem 'pg', '~> 1.1'
gem 'puma', '>= 5.0'
gem 'rails', '~> 7.1.4'
gem 'redis'
gem 'sidekiq'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"
gem 'bootsnap', require: false
gem 'devise'
gem 'font-awesome-sass'
gem 'heroicon'
gem 'rubocop', require: false
gem 'slim'
gem 'tailwindcss-rails'
gem 'tzinfo-data', platforms: %i[windows jruby]
gem 'view_component'
gem 'webpacker'

group :development, :test do
  gem 'brakeman', require: false
  gem 'debug', platforms: %i[mri windows], require: 'debug/prelude'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry'
  # Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
  gem 'rubocop-rails-omakase', require: false
end

group :development do
  gem 'annotate'
  gem 'rspec-rails'
  gem 'web-console'
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
