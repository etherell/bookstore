# frozen_string_literal: true

module Books
  class SortingQuery < BaseQuery
    NEWEST = 'newest'
    POPULAR = 'popular'
    LOW_PRICE = 'low_price'
    HIGH_PRICE = 'high_price'

    def initialize(books, sorting)
      @books = books
      @sorting = sorting
    end

    def call
      return @books if @sorting.blank?

      order_books.includes(%i[image_attachment authors])
    end

    private

    def order_books
      case @sorting
      when NEWEST then @books.order(created_at: :desc)
      when LOW_PRICE then @books.order(price_cents: :asc)
      when HIGH_PRICE then @books.order(price_cents: :desc)
      else @books
      end
    end
  end
end
