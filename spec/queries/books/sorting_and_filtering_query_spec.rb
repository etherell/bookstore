# frozen_string_literal: true

RSpec.describe Books::SortingAndFilteringQuery do
  before { create_list(:book, 20) }

  let(:books) { Book.all }
  let(:sorted_books) { described_class.new(nil, order).call }

  describe '#call' do
    context 'when newest first' do
      let(:order) { 'newest' }

      it 'returns newest book first' do
        expect(sorted_books[1..].pluck(:created_at)).to all(be < sorted_books.first.created_at)
      end

      it 'changes books orde' do
        expect(sorted_books).not_to eq(books)
      end
    end

    context 'when low price first' do
      let(:order) { 'price_asc' }

      it 'returns cheapest book first' do
        expect(sorted_books[1..].pluck(:price_cents)).to all(be > sorted_books.first.price_cents)
      end

      it 'changes books order' do
        expect(sorted_books).not_to eq(books)
      end
    end

    context 'when high price first' do
      let(:order) { 'price_desc' }

      it 'returns cheapest book first' do
        expect(sorted_books[1..].pluck(:price_cents)).to all(be < sorted_books.first.price_cents)
      end

      it 'changes books order' do
        expect(sorted_books).not_to eq(books)
      end
    end

    context 'when order not set' do
      let(:order) { FFaker::Lorem.word }

      it 'not changes books order' do
        expect(sorted_books).to eq(books)
      end
    end
  end
end
