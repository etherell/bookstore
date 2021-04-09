# frozen_string_literal: true

class BooksController < ApplicationController
  def index
    @categories = Category.all
    @pagy, @books = pagy(set_books)
  end

  private

  def set_books
    params[:category_id] ? Book.by_category(params[:category_id]).decorate : Book.all.decorate
  end
end
