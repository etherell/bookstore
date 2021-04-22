# frozen_string_literal: true

RSpec.describe BooksController do
  describe '#index' do
    before { stub_const('Book::PER_PAGE', 3) }

    context 'when success request' do
      before { get :index }

      it 'returns successful status' do
        expect(response).to have_http_status(:ok)
      end

      it 'renders index template' do
        expect(response).to render_template(:index)
      end
    end

    context 'without books' do
      it 'returns no books' do
        get :index
        expect(assigns(:books)).to be_empty
      end
    end

    context 'with books' do
      let(:books) { create_list(:book, Book::PER_PAGE) }
      let(:category) { create(:category) }
      let(:additional_books_length) { 2 }
      let(:category_books) { create_list(:book, additional_books_length, category: category) }

      before { books }

      it 'returns apropriate books' do
        get :index
        expect(assigns(:books)).to match_array(books)
      end

      it 'returns category books' do
        category_books
        get :index, params: { category_id: category.id }
        expect(assigns(:books)).to match_array(category_books)
      end

      it 'returns second page books' do
        category_books
        get :index, params: { page: 2 }
        expect(assigns(:books).length).to eq(additional_books_length)
      end
    end
  end

  describe '#show' do
    let(:book) { create(:book, :with_materials) }

    context 'when success request' do
      before { get :show, params: { id: book.id } }

      it 'returns successful status' do
        expect(response).to have_http_status(:ok)
      end

      it 'renders index template' do
        expect(response).to render_template(:show)
      end

      it 'returns a valid book' do
        expect(assigns(:book)).to be_a(Book)
      end

      it 'returns apropriate book' do
        expect(assigns(:book)).to eq(book)
      end
    end

    context 'when request without book' do
      subject(:show_request) { get :show, params: { id: random_number } }

      let(:random_number) { rand(0..100) }

      it 'redirects to index page' do
        expect(show_request).to redirect_to(action: :index)
      end

      it 'returns error flash' do
        show_request
        expect(flash[:error]).to eq(I18n.t('books.errors.record_not_found'))
      end

      it 'returns no books' do
        show_request
        expect(assigns(:book)).to be_nil
      end
    end
  end
end
