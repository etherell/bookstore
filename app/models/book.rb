# frozen_string_literal: true

class Book < ApplicationRecord
  MAX_TITLE_LENGTH = 50
  PER_PAGE = 8

  belongs_to :category, counter_cache: true
  has_many :author_books, dependent: :destroy
  has_many :book_materials, dependent: :destroy
  has_many :authors, through: :author_books
  has_many :materials, through: :book_materials
  has_many_attached :images

  validates :price_cents, presence: true
  validates :title, presence: true, length: { maximum: MAX_TITLE_LENGTH }
  validates :authors, presence: true
  validates :quantity, numericality: true
  validates :publication_year, numericality: true

  monetize :price_cents, as: 'price'
end
