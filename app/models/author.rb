# frozen_string_literal: true

class Author < ApplicationRecord
  MAX_FIRST_NAME_LENGTH = 50
  MAX_LAST_NAME_LENGTH = 50
  NAMES_FORMAT = /\A[A-Za-z]*\z/.freeze

  has_many :author_books, dependent: :destroy
  has_many :books, through: :author_books

  validates :first_name, presence: true, length: { maximum: MAX_FIRST_NAME_LENGTH }
  validates :last_name, presence: true, length: { maximum: MAX_LAST_NAME_LENGTH }
  validates :first_name, format: { with: NAMES_FORMAT }
  validates :last_name, format: { with: NAMES_FORMAT }
end
