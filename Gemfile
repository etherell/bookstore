# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby(File.read(File.join(File.dirname(__FILE__), '.ruby-version')).strip)

gem 'aasm', '~> 5.1', '>= 5.1.1'
gem 'activeadmin', '~> 2.9'
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'devise', '~> 4.7', '>= 4.7.3'
gem 'haml', '~> 5.2', '>= 5.2.1'
gem 'i18n', '~> 1.8', '>= 1.8.10'
gem 'jbuilder', '~> 2.7'
gem 'mini_magick', '~> 4.11'
gem 'omniauth-facebook', '~> 8.0'
gem 'pagy', '~> 4.1'
gem 'pg', '~> 1.2', '>= 1.2.3'
gem 'puma', '~> 4.1'
gem 'pundit', '~> 2.1'
gem 'rails', '~> 6.0.3', '>= 6.0.3.5'
gem 'require_all', '~> 3.0'
gem 'sass-rails', '>= 6'
gem 'shrine', '~> 3.3'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'
# gem 'redis', '~> 4.0'
# gem 'image_processing', '~> 1.2'

group :development, :test do
  gem 'pry-byebug', '~> 3.9'
end

group :development do
  gem 'brakeman', '~> 5.0', require: false
  gem 'bullet', '~> 6.1', '>= 6.1.4'
  gem 'bundler-audit', '~> 0.8.0', require: false
  gem 'database_consistency', '~> 0.8.13', require: false
  gem 'fasterer', '~> 0.9.0', require: false
  gem 'listen', '~> 3.2'
  gem 'overcommit', '~> 0.57.0'
  gem 'rails_best_practices', '~> 1.20', require: false
  gem 'rubocop-performance', '~> 1.10', '>= 1.10.2', require: false
  gem 'rubocop-rails', '~> 2.9', '>= 2.9.1'
  gem 'rubocop-rspec', '~> 2.2', require: false
  gem 'simplecov', '~> 0.21.2', require: false
  gem 'spring', '~> 2.1', '>= 2.1.1'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '~> 3.35', '>= 3.35.3'
  gem 'capybara-screenshot', '~> 1.0', '>= 1.0.25'
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.5'
  gem 'rspec_junit_formatter', '~> 0.4.1'
  gem 'rspec-rails', '~> 5.0', '>= 5.0.1'
  gem 'selenium-webdriver', '~> 3.142', '>= 3.142.7'
  gem 'shoulda-matchers', '~> 4.5', '>= 4.5.1'
  gem 'site_prism', '~> 3.7', '>= 3.7.1'
  gem 'webdrivers', '~> 4.6'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
