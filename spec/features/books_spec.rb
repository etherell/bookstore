# frozen_string_literal: true

RSpec.describe 'Books', type: :feature do
  describe '#index' do
    let(:index_page) { Pages::Books::Index.new }

    include_context 'with random and category books'

    context 'when category filter used' do
      it 'request filter with url params' do
        index_page.load(query: { category_id: category.id })
        expect(index_page.books.length).to eq(category_books_amount)
      end

      it 'click category filter' do
        index_page.load
        index_page.filters.first.click
        expect(index_page.books.length).to eq(category_books_amount)
      end
    end

    context 'when sorting used' do
      it 'clicks and comes to the next page' do
        index_page.load
        books_before = index_page.books
        index_page.sorting_options.first.click
        expect(index_page.books.first).not_to eq(books_before.first)
      end
    end

    context 'when load more clicked' do
      include_context 'with second page books'
      let(:books_amount) { random_books_amount + category_books_amount + second_page_books_amount }

      it 'clicks sorting from with newest first', js: true do
        second_page_books
        index_page.load
        index_page.load_more_button.click
        expect(index_page.books.length).to eq(books_amount)
      end
    end

    context 'when all elements present' do
      include_context 'with second page books'

      it 'has all elements' do
        second_page_books
        index_page.load
        expect(index_page).to be_all_there
      end
    end
  end

  describe '#show' do
    let(:show_page) { Pages::Books::Show.new }
    let(:book) { create(:book) }

    before { show_page.load(id: book.id) }

    context 'when calculator used' do
      let(:random_number) { rand(1..5) }
      let(:new_quantity) { random_number + 1 }
      let(:add_books) { random_number.times { show_page.add_book } }

      it 'changes calculator value', js: true do
        price_before_click = show_page.book_price
        add_books
        expect(show_page.book_price).to eq((price_before_click * new_quantity).round(2))
      end

      it 'changes books amount value', js: true do
        expect { add_books }.to change(show_page, :books_quantity).from('1').to(new_quantity.to_s)
      end
    end

    context 'when read more clicked' do
      let(:read_more_click) { show_page.book.read_more.click }

      it 'changes books amount value', js: true do
        description_before_click = show_page.book_description
        read_more_click
        expect(show_page.book_description.length).to be > description_before_click.length
      end
    end

    context 'when all elements present' do
      it 'has all elements' do
        expect(show_page).to be_all_there
      end
    end
  end
end
