# frozen_string_literal: true

module BooksHelper
  def category_filter_placeholder(params)
    Category.find(params[:category_id]).title
  rescue ActiveRecord::RecordNotFound
    Category.first.title
  end

  def back_to_results_link(request_referer)
    request_referer.presence || books_path
  end

  def books_sorting_options
    Books::SortingAndFilteringQuery::SORTINGS.keys
  end
end
