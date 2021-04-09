# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :authors
  has_one_attached :image

  validates :price_cents, presence: true
  validates :title, presence: true

  monetize :price_cents, as: 'price'

  scope :by_category, ->(category_id) { where(category_id: category_id) }
end
