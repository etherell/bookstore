# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    description { Faker::Lorem.paragraph(sentence_count: 25) }
    price_cents { rand(500...10_000) }
    publication_year { rand(1990..2020) }
    height { rand(5.0..10.0).round(1) }
    width { rand(0.5..1.0).round(1) }
    depth { rand(4.0..7.0).round(1) }
    category { create(:category) }

    factory :book_with_authors_and_materials do
      materials { create_list(:material, 3) }
      authors { create_list(:author, 3) }
    end
  end
end
