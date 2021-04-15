# frozen_string_literal: true

module BooksHelper
  def category_filter_placeholder(params, categories)
    return categories.first.title unless params[:category_id]

    begin
      categories.find(params[:category_id]).title
    rescue ActiveRecord::RecordNotFound
      categories.first.title
    end
  end
end
