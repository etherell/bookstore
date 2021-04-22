# frozen_string_literal: true

class BookMaterial < ApplicationRecord
  belongs_to :material
  belongs_to :book
end
