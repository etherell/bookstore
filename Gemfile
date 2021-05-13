# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby(File.read(File.join(File.dirname(__FILE__), '.ruby-version')).strip)

gem 'aasm', '~> 5.1', '>= 5.1.1'
gem 'actionpack', '~> 6.0.3.7'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'draper', '~> 4.0', '>= 4.0.1'
gem 'jbuilder', '~> 2.7'
gem 'mini_magick', '~> 4.11'
gem 'money-rails', '~> 1.14'
gem 'pg', '~> 1.2', '>= 1.2.3'
gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.3', '>= 6.0.3.5'
gem 'reform-rails', '~> 0.2.2'
gem 'require_all', '~> 3.0'
gem 'virtus', '~> 1.0', '>= 1.0.5'
gem 'will_paginate', '~> 3.3'
# gem 'redis', '~> 4.0'
# gem 'image_processing', '~> 1.2'

# authentication and authorization
gem 'activeadmin', '~> 2.9'
gem 'bcrypt', '~> 3.1.7'
gem 'devise', '~> 4.8'
gem 'omniauth', '~> 1.9.1'
gem 'omniauth-facebook', '8.0.0'
gem 'omniauth-rails_csrf_protection'
gem 'pundit', '~> 2.1'

# frontend
gem 'country_select', '~> 5.0', '>= 5.0.1'
gem 'gon', '~> 6.4'
gem 'haml', '~> 5.2', '>= 5.2.1'
gem 'sass-rails', '>= 6'
gem 'simple_form', '~> 5.1'
gem 'webpacker', '~> 5.0'

group :development, :test do
  # debugging and testing
  gem 'factory_bot_rails', '~> 6.1'
  gem 'pry-byebug', '~> 3.9'
  gem 'rspec-rails', '~> 5.0', '>= 5.0.1'
  gem 'simplecov', '~> 0.21.2', require: false

  # lintering
  gem 'brakeman', '~> 5.0', require: false
  gem 'bundler-audit', '~> 0.8.0', require: false
  gem 'database_consistency', '~> 0.8.13', require: false
  gem 'fasterer', '~> 0.9.0', require: false
  gem 'ffaker', '~> 2.18'
  gem 'haml_lint', '~> 0.37.0', require: false
  gem 'overcommit', '~> 0.57.0'
  gem 'rails_best_practices', '~> 1.20', require: false
  gem 'rubocop-performance', '~> 1.10', '>= 1.10.2', require: false
  gem 'rubocop-rails', '~> 2.7', '>= 2.7.1', require: false
  gem 'rubocop-rspec', '~> 2.2', require: false
  gem 'rubycritic', '~> 4.6', '>= 4.6.1', require: false
end

group :development do
  gem 'bullet', '~> 6.1', '>= 6.1.4'
  gem 'httplog', '~> 1.4', '>= 1.4.3'
  gem 'letter_opener', '~> 1.7'
  gem 'listen', '~> 3.2'
  gem 'spring', '~> 2.1', '>= 2.1.1'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '~> 3.35', '>= 3.35.3'
  gem 'capybara-screenshot', '~> 1.0', '>= 1.0.25'
  gem 'pundit-matchers', '~> 1.6.0'
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.5'
  gem 'rspec_junit_formatter', '~> 0.4.1'
  gem 'selenium-webdriver', '~> 3.142', '>= 3.142.7'
  gem 'shoulda-matchers', '~> 4.5', '>= 4.5.1'
  gem 'site_prism', '~> 3.7', '>= 3.7.1'
  gem 'webdrivers', '~> 4.6'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
