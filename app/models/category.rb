# frozen_string_literal: true

class Category < ApplicationRecord
  MAX_NAME_LENGTH = 50

  has_many :books, dependent: :destroy

  validates :title, presence: true, length: { maximum: MAX_NAME_LENGTH }
end
