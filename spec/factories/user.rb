# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { FFaker::Internet.free_email }
    password { 'UserPassword1234' }
  end
end
