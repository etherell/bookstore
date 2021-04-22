# frozen_string_literal: true

require 'simplecov'

SimpleCov.start 'rails' do
  add_filter '/mailers/'
  add_filter '/jobs/'
end

SimpleCov.minimum_coverage 95
