# frozen_string_literal: true

module BooksHelper
  def category_filter_placeholder(params, categories)
    categories.find(params[:category_id]).title
  rescue ActiveRecord::RecordNotFound
    categories.first.title
  end

  def back_to_results_link(request_referer)
    request_referer.presence || books_path
  end
end
