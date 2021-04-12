# frozen_string_literal: true

class BooksController < ApplicationController
  respond_to :js, :html, only: :index

  def index
    @books = Book.filter_by_category(params[:category_id])
    @books = Books::SortingQuery.call(@books, params[:sorting])
    @books = @books.paginate(page: params[:page], per_page: 8)
                   .includes(%i[image_attachment authors])
  end

  def show
    @book = Book.find(params[:id]).decorate
    @quantity = params[:quantity] || 1
  end
end
