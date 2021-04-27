# frozen_string_literal: true

class PaginatingDecorator < Draper::CollectionDecorator
  delegate :current_page, :total_entries, :total_pages, :per_page, :offset, :next_page
end
