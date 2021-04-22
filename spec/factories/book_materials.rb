# frozen_string_literal: true

FactoryBot.define do
  factory :book_material do
    material
    book
  end
end
