# frozen_string_literal: true

module Books
  class SortingAndFilteringQuery < BaseQuery
    SORTINGS = {
      newest: 'created_at desc',
      price_asc: 'price_cents asc',
      price_desc: 'price_cents desc',
      popular: nil
    }.freeze

    def initialize(category_id, sorting)
      @category_id = category_id
      @sorting = sorting
    end

    def call
      filter_books
      order_books
    end

    private

    def filter_books
      @books = @category_id ? Book.where(category_id: @category_id) : Book.all
    end

    def order_books
      return @books unless @sorting

      @books.order(SORTINGS[@sorting.to_sym])
    end
  end
end
