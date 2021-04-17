# frozen_string_literal: true

RSpec.describe BooksController, type: :controller do
  describe '#index' do
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
      let(:books) { create_list(:book_with_authors_and_materials, 8) }
      let(:category) { create(:category) }
      let(:additional_books_length) { 3 }
      let(:category_books) do
        create_list(:book_with_authors_and_materials, additional_books_length, category: category)
      end

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
    let(:book) { create(:book_with_authors_and_materials) }

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

      it 'returns successful status' do
        expect { show_request }.to raise_error(ActiveRecord::RecordNotFound)
      end

      it 'returns a valid book' do
        expect(assigns(:book)).to be_nil
      end
    end
  end
end
