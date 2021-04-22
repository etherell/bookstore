# frozen_string_literal: true

RSpec.describe BookDecorator do
  let(:book_with_nested) { create(:book, :with_materials).decorate }
  let(:book) { build(:book).decorate }

  describe '#available_imade' do
    it 'returns placeholder' do
      expect(book.available_image).to eq(BookDecorator::PLACEHOLDER_PATH)
    end
  end

  describe '#authors_names' do
    context 'with authors' do
      let(:author_first) { create(:author, first_name: 'Valera', last_name: 'Petrov') }
      let(:author_second) { create(:author, first_name: 'Petr', last_name: 'Valerov') }
      let(:expected_result) { 'Valera Petrov, Petr Valerov' }

      before do
        create(:author_book, book: book, author: author_first)
        create(:author_book, book: book, author: author_second)
        book.reload
      end

      it 'returns authors names' do
        expect(book.decorate.authors_names).to include(expected_result)
      end
    end
  end

  describe '#short_title' do
    let(:title_length) { BookDecorator::MAX_TITLE_LENGTH + rand(1..10) }
    let(:book) { create(:book, title: FFaker::Lorem.characters(title_length)).decorate }

    it 'returns short title' do
      expect(book.short_title.length).to be < book.title.length
    end
  end

  describe '#short_description' do
    it 'returns short description' do
      expect(book.short_description.length).to be < book.description.length
    end
  end

  describe '#dimensions?' do
    context 'when all dimensions exists' do
      it 'returns true' do
        expect(book).to be_dimensions
      end
    end

    context 'when width nil' do
      let(:book) { create(:book, width: nil).decorate }

      it 'returns false' do
        expect(book).not_to be_dimensions
      end
    end

    context 'when height nil' do
      let(:book) { create(:book, height: nil).decorate }

      it 'returns false' do
        expect(book).not_to be_dimensions
      end
    end

    context 'when depth nil' do
      let(:book) { create(:book, depth: nil).decorate }

      it 'returns false' do
        expect(book).not_to be_dimensions
      end
    end
  end

  describe '#dimensions' do
    context 'when all dimensions exists' do
      let(:expected_result) do
        I18n.t('books.show.dimensions', height: book.height, width: book.width, depth: book.depth)
      end

      it 'contains width' do
        expect(book.dimensions).to eq(expected_result)
      end
    end
  end

  describe '#material_names' do
    context 'when materials present' do
      let(:material_first) { create(:material, name: 'Paper') }
      let(:material_second) { create(:material, name: 'Leather') }
      let(:expected_result) { 'Paper, Leather' }

      before do
        create(:book_material, book: book, material: material_first)
        create(:book_material, book: book, material: material_second)
      end

      it 'includes necessary materials' do
        expect(book.meterials_names).to eq(expected_result)
      end
    end

    context 'without materals' do
      it 'retuns materials' do
        expect(book.meterials_names).to be_empty
      end
    end
  end
end
