# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { FFaker::Lorem.word.capitalize }
    description { FFaker::Lorem.paragraphs }
    price_cents { rand(500...10_000) }
    publication_year { rand(1990..2020) }
    height { rand(5.0..10.0).round(1) }
    width { rand(0.5..1.0).round(1) }
    depth { rand(4.0..7.0).round(1) }
    category
    authors { create_list(:author, 3) }
    quantity { rand(2..10) }

    trait :with_materials do
      materials { create_list(:material, 3) }
    end
  end
end
