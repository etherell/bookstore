# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BooksHelper, type: :helper do
  describe '#category_filter_placeholder' do
    let(:placeholder) { helper.category_filter_placeholder(params, categories) }
    let(:categories) { Category.all }

    before { create_list(:category, 5) }

    context 'with categories and wrong params' do
      let(:params) { { category_id: 'random' } }

      it 'returns title of the first category' do
        expect(placeholder).to eq(categories.first.title)
      end
    end

    context 'with categories and valid params' do
      let(:params) { { category_id: categories.last.id } }

      it 'returns title of the first category' do
        expect(placeholder).to eq(categories.last.title)
      end
    end

    context 'without category_id' do
      let(:params) { { category_id: nil } }

      it 'returns title of the first category' do
        expect(placeholder).to eq(categories.first.title)
      end
    end
  end

  describe '#back_to_results_link' do
    context 'with referer' do
      let(:test_referer) { '/books?category_id=1' }
      let(:get_link) { helper.back_to_results_link(test_referer) }

      it 'returns referer link' do
        expect(get_link).to eq(test_referer)
      end
    end

    context 'without referer' do
      let(:test_referer) { nil }
      let(:get_link) { helper.back_to_results_link(test_referer) }

      it 'returns link to books' do
        expect(get_link).to eq(books_path)
      end
    end
  end
end
