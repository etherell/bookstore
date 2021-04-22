# frozen_string_literal: true

FactoryBot.define do
  factory :author do
    first_name { FFaker::Lorem.word.capitalize }
    last_name { FFaker::Lorem.word.capitalize }
  end
end
