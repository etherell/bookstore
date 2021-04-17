# frozen_string_literal: true

RSpec.describe BookDecorator do
  let(:book_with_nested) { create(:book_with_authors_and_materials).decorate }
  let(:book) { create(:book).decorate }

  describe '#available_imade' do
    it 'returns placeholder' do
      expect(book.available_image).to eq(BookDecorator::PLACEHOLDER_PATH)
    end
  end

  describe '#authors_names' do
    context 'with authors' do
      it 'returns authors names' do
        expect(book_with_nested.authors_names).to include(book_with_nested.authors.first.name)
      end
    end

    context 'without authors' do
      it 'dosn\'t authors names' do
        expect(book.authors_names).to be_empty
      end
    end
  end

  describe '#short_title' do
    let(:book) { create(:book, title: Faker::Lorem.paragraph(sentence_count: 25)).decorate }

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

    context 'when some dimensions nil' do
      let(:book) { create(:book, width: nil).decorate }

      it 'returns false' do
        expect(book).not_to be_dimensions
      end
    end
  end

  describe '#dimensions' do
    context 'when all dimensions exists' do
      it 'contains width' do
        expect(book.dimensions).to include(book.width.to_s)
      end

      it 'contains height' do
        expect(book.dimensions).to include(book.height.to_s)
      end

      it 'contains depth' do
        expect(book.dimensions).to include(book.depth.to_s)
      end
    end
  end

  describe '#material_names' do
    context 'when materials present' do
      it 'includes first material' do
        expect(book_with_nested.meterials_names).to include(book_with_nested.materials.first.name)
      end

      it 'includes last material' do
        expect(book_with_nested.meterials_names).to include(book_with_nested.materials.last.name)
      end
    end

    context 'without materals' do
      it 'retuns materials' do
        expect(book.meterials_names).to be_empty
      end
    end
  end
end
