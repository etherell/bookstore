# frozen_string_literal: true

RSpec.describe 'Books' do
  describe '#index' do
    let(:index_page) { Pages::Books::Index.new }

    context 'when category filter used' do
      include_context 'with random and category books'

      it 'request filter with url params' do
        index_page.load(query: { category_id: category.id })
        expect(index_page.books.length).to eq(category_books_amount)
      end

      it 'click category filter' do
        index_page.load
        index_page.filters.last.click
        expect(index_page.books.length).to eq(category_books_amount)
      end
    end

    context 'when sorting used' do
      include_context 'with random and category books'

      before { index_page.load }

      it 'clicks and comes to the next page' do
        books_before = index_page.books
        index_page.sorting_options.first.click
        expect(index_page.books.first).not_to eq(books_before.first)
      end
    end

    context 'when load more clicked' do
      include_context 'with random and category books'
      include_context 'with second page books'

      let(:books_amount) { random_books_amount + category_books_amount + second_page_books_amount }

      it 'clicks sorting from with newest first', js: true do
        second_page_books
        index_page.load
        index_page.load_more_button.click
        expect(index_page.books.length).to eq(books_amount)
      end
    end

    context 'when all book elements present' do
      let(:book_section) { index_page.book }
      let(:book) { create(:book) }

      before do
        book
        index_page.load
      end

      it { expect(book_section).to have_show_link }
      it { expect(book_section).to have_buy_link }
      it { expect(book_section).to have_section_title }
      it { expect(book_section).to have_price }
      it { expect(book_section).to have_authors }
    end

    context 'when all page elements present' do
      include_context 'with random and category books'
      include_context 'with second page books'

      before do
        second_page_books
        index_page.load
      end

      it { expect(index_page).to have_page_title }
      it { expect(index_page).to have_load_more_button }
      it { expect(index_page).to have_books }
      it { expect(index_page).to have_sorting_dropdowns }
      it { expect(index_page).to have_sorting_options }
    end
  end

  describe '#show' do
    let(:show_page) { Pages::Books::Show.new }
    let(:book) { create(:book, :with_materials) }

    before { show_page.load(id: book.id) }

    context 'when calculator used' do
      let(:random_number) { rand(1...book.quantity) }
      let(:new_quantity) { random_number.next }
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

    context 'when all book elements present' do
      let(:book_section) { show_page.book }

      it { expect(book_section).to have_section_title }
      it { expect(book_section).to have_authors }
      it { expect(book_section).to have_price }
      it { expect(book_section).to have_description }
      it { expect(book_section).to have_publication_year }
      it { expect(book_section).to have_dimensions }
      it { expect(book_section).to have_materials }
      it { expect(book_section).to have_cart_button }
      it { expect(book_section).to have_plus_button }
      it { expect(book_section).to have_minus_button }
      it { expect(book_section).to have_quantity_input }
      it { expect(book_section).to have_read_more }
    end
  end
end
