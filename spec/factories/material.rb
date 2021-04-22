# frozen_string_literal: true

FactoryBot.define do
  factory :material do
    name { FFaker::Lorem.word }
  end
end
