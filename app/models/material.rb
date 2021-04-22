# frozen_string_literal: true

class Material < ApplicationRecord
  MAX_NAME_LENGTH = 50

  has_many :book_materials, dependent: :destroy
  has_many :books, through: :book_materials

  validates :name, presence: true, length: { maximum: MAX_NAME_LENGTH }
end
