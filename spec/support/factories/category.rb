# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    title { Faker::ProgrammingLanguage.name }
  end
end
