# frozen_string_literal: true

class BooksController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  respond_to :js, :html, only: :index
  before_action :count_books, only: :index

  def index
    @books = policy_scope(Book)
    @books = Books::SortingAndFilteringQuery.call(@books, params[:category_id], params[:sorting])
                                            .paginate(page: params[:page], per_page: Book::PER_PAGE)
                                            .includes(%i[images_attachments authors])
                                            .decorate
  end

  def show
    @book = Book.find(params[:id]).decorate
    authorize @book
    set_params_for_js
  end

  private

  def record_not_found
    flash[:error] = I18n.t('books.errors.record_not_found')
    redirect_to action: :index
  end

  def count_books
    @books_count = policy_scope(Book).count || 0
  end

  def set_params_for_js
    gon.currency = I18n.t('books.show.currency')
    gon.quantity = @book.quantity
    gon.description = @book.description
  end
end
